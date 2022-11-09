import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/cards/category_card.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/spacing_values.dart';
import 'list/category_list_controller.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListControllerProvider).categories;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpacing),
      child: (categories != null)
          ? categories.maybeWhen(
              data: (stream) => StreamBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final dataList =
                            snapshot.data!.map((c) => CategoryCard(c)).toList();
                        return ListView.separated(
                          itemBuilder: (_, index) => dataList[index],
                          itemCount: dataList.length,
                          separatorBuilder: (_, __) =>
                              const DefaultSpacer(dim: kCardSpacing),
                          // itemExtent: MediaQuery.of(context).size.height / 3.5,
                        );
                      }
                      return const Text('Empty categories');
                    },
                    stream: stream,
                  ),
              orElse: () => const Text('No categories'))
          : const Text('No stream'),
    );
  }
}
