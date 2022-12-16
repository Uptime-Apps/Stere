import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'empty_list.dart';

class StreamListView<T> extends StatefulWidget {
  const StreamListView({
    this.headerBuilder,
    this.footerBuilder,
    this.filterData,
    required this.stream,
    required this.onData,
    required this.noContentMessage,
    required this.noContentIcon,
    required this.noContentActionRoute,
    super.key,
  });

  final IconData noContentIcon;
  final List<Widget>? Function(List<T>?) onData;
  final Iterable<T> Function(List<T>)? filterData;
  final Stream<List<T>>? stream;
  final String noContentActionRoute;
  final String noContentMessage;
  final Widget Function(BuildContext context, AsyncValue<List<T>?> snapshot)?
      footerBuilder;
  final Widget Function(BuildContext context, AsyncValue<List<T>?> snapshot)?
      headerBuilder;

  @override
  State<StreamListView<T>> createState() => _StreamListViewState<T>();
}

class _StreamListViewState<T> extends State<StreamListView<T>> {
  final String logName = 'StreamListViewState';
  late AsyncValue<List<T>?> data;

  @override
  void initState() {
    super.initState();
    data = const AsyncValue.loading();
    widget.stream?.listen(
      (event) => setState(() => data = AsyncValue.data(
          (widget.filterData != null)
              ? widget.filterData!(event).toList()
              : event)),
      onDone: () => log('Stream Listener: DONE', name: logName),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget child = data.when<Widget>(
      data: (data) {
        final listViewItems = widget.onData(data);
        if (listViewItems?.isEmpty ?? true) {
          // if no items
          return Center(
            child: EmptyListScreen(
              message: widget.noContentMessage,
              icon: widget.noContentIcon,
              actionRoute: widget.noContentActionRoute,
            ),
          );
        }
        return ListView.builder(
          itemBuilder: (_, i) => listViewItems[i],
          itemCount: listViewItems!.length,
          shrinkWrap: true,
        );
      },
      error: (error, stackTrace) {
        log(
          'Something went wrong',
          error: error,
          stackTrace: stackTrace,
          name: 'StreamListView<${T.toString()}>',
        );
        return Center(
          child: EmptyListScreen(
            message: widget.noContentMessage,
            icon: widget.noContentIcon,
            actionRoute: widget.noContentActionRoute,
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    final colorScheme = Theme.of(context).colorScheme;
    return (widget.headerBuilder == null && widget.footerBuilder == null)
        ? child
        : Column(
            children: [
              if (widget.headerBuilder != null) ...[
                widget.headerBuilder!(context, data),
              ],
              Expanded(child: child),
              if (widget.footerBuilder != null) ...[
                const Divider(height: 1),
                SafeArea(
                  child: Container(
                    // color: colorScheme.surfaceVariant,
                    child: widget.footerBuilder!(context, data),
                  ),
                ),
              ]
            ],
          );
  }
}
