import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
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
    return Padding(
      padding: const EdgeInsets.all(kCarouselPadding),
      child: (categories != null)
          ? categories.maybeWhen(
              data: (stream) {
                return StreamBuilder(
                  stream: stream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const NoCategoriesFound();
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

class NoCategoriesFound extends StatelessWidget {
  const NoCategoriesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(S
            .of(context)
            .emNoObjectsRegistered(S.of(context).lblCategories(2))),
        const SizedBox(height: kCarouselPadding),
        ElevatedButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(CategoryForm.route),
            child: Text(
                S.of(context).lblCreateObject(S.of(context).lblCategories(1))))
      ],
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
