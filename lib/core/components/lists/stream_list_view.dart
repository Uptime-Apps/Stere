import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'empty_list.dart';

class StreamListView<T> extends StatefulWidget {
  const StreamListView({
    this.headerBuilder,
    this.footerBuilder,
    required this.stream,
    required this.onData,
    required this.noContentMessage,
    required this.noContentIcon,
    required this.noContentActionRoute,
    super.key,
  });

  final IconData noContentIcon;
  final List<Widget>? Function(List<T>?) onData;
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
  late AsyncValue<List<T>?> data;
  @override
  void initState() {
    super.initState();
    data = const AsyncValue.loading();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
          case ConnectionState.waiting:
            data = const AsyncValue.loading();
            break;
          case ConnectionState.none:
            data = const AsyncValue.data(null);
            break;
          case ConnectionState.done:
            data = AsyncValue.data(snapshot.data);
            break;
        }
        return Column(
          children: [
            if (widget.headerBuilder != null)
              widget.headerBuilder!(context, data),
            data.when<Widget>(
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
                return Column(
                  children: [
                    // headerBuilder,
                    ListView.builder(
                      itemBuilder: (_, i) => listViewItems[i],
                      // separatorBuilder: (_, __) => const Divider(),
                      itemCount: listViewItems!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                    ),
                    // footerBuilder,
                  ],
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
              loading: () => const Text('loading'),
            ),
            if (widget.footerBuilder != null)
              widget.footerBuilder!(context, data),
          ],
        );
      }),
      stream: widget.stream,
    );
  }
}
