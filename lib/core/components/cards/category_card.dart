import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../views/home/home_controller.dart';
import '../../constants/image_assets.dart';
import '../../constants/spacing_values.dart';
import '../others/shimmers.dart';
import '../others/utilities.dart';

class CategoryCard extends ConsumerWidget {
  const CategoryCard(this.category, {Key? key, this.width}) : super(key: key);
  final Category category;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    if (category.imagePath != null) {
      final imagePath = ref.watch(homeCategoryImageProvider(category));
      return imagePath.when(
        data: (data) => Image(
          image: NetworkImage(data!),
          fit: BoxFit.cover,
          color: Colors.black.withOpacity(0.3),
          colorBlendMode: BlendMode.hardLight,
          frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
            return Stack(
              fit: StackFit.expand,
              children: [
                child,
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSpacing / 2, vertical: kSpacing / 3),
                  child: Center(
                    // alignment: Alignment.bottomRight,
                    child: Text(category.name,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(color: colorScheme.onPrimary)),
                  ),
                )
              ],
            );
          }),
          loadingBuilder: ((context, child, loadingProgress) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: LayoutBuilder(builder: (context, constraints) {
                return (loadingProgress != null)
                    ? Column(
                        children: [
                          ShimmeringBox(
                            height: constraints.maxHeight - kProgressBarHeight,
                          ),
                          LinearProgressBar(
                              value:
                                  (loadingProgress.expectedTotalBytes != null)
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null),
                        ],
                      )
                    : child;
              }),
            );
          }),
        ),
        loading: () => const ShimmeringCard(),
        error: (_, stackTrace) => Container(color: Colors.red),
      );
    } else {
      // If there's no image from firebase
      return DefaultImageCategoryCard(category: category);
    }
  }
}

class DefaultImageCategoryCard extends StatelessWidget {
  const DefaultImageCategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage(
              iaDefaultCategoryImage,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                right: kSpacing / 2, bottom: kSpacing / 3),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FittedBox(
                child: Text(category.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: colorScheme.onPrimary)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
