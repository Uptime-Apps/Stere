import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../core/components/cards/call_to_action_card.dart';
import '../../../core/components/cards/category_card.dart';
import '../../../core/constants/spacing_values.dart';
import '../../../l10n/generated/l10n.dart';
import '../../categories/category_form.dart';
import '../home_controller.dart';

class CategoryCarousel extends ConsumerWidget {
  const CategoryCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Stream<List<Category>>>? categories =
        ref.watch(homeControllerProvider).categories;
    final String Function(num isPlural) categoriesText =
        S.of(context).lblCategories;
    return Padding(
      padding: const EdgeInsets.all(kCarouselPadding),
      child: (categories != null)
          ? categories.maybeWhen(
              data: (stream) {
                return StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return CallToActionCard(
                        msg: S
                            .of(context)
                            .emNoObjectsRegistered(categoriesText(2)),
                        actionLabel:
                            S.of(context).lblCreateObject(categoriesText(1)),
                        onPressed: () =>
                            Navigator.of(context).pushNamed(CategoryForm.route),
                      );
                    }
                    return const Text('showing categories');
                  },
                );
              },
              orElse: () => const CategoryCarouselLoading())
          : const CategoryCarouselLoading(),
    );
  }
}

class CategoryCarouselLoading extends StatelessWidget {
  const CategoryCarouselLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      shrinkWrap: false,
      itemExtent: MediaQuery.of(context).size.width / 2.7,
      children: List<Widget>.generate(
          4,
          (_) => const Card(
                clipBehavior: Clip.hardEdge,
                child: ShimmeringBox(),
              )),
    );
  }
}
