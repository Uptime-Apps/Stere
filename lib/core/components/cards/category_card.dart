import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../views/categories/list/category_list_controller.dart';
import '../../../views/home/home_controller.dart';
import '../../constants/icons.dart';
import '../../constants/image_assets.dart';
import '../../constants/spacing_values.dart';
import '../others/shimmers.dart';
import '../others/utilities.dart';

class CategoryImageCard extends ConsumerWidget {
  static const logName = 'category-image-card';
  const CategoryImageCard(this.category, {Key? key, this.width})
      : super(key: key);
  final Category category;
  final double? width;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (category.imagePath != null) {
      final imagePath = ref.watch(homeCategoryImageProvider(category));
      return imagePath.when(
        data: (data) => CategoryImageCardBody(
          category,
          image: NetworkImage(data!),
        ),
        loading: () => const ShimmeringCard(),
        error: (_, stackTrace) {
          log(stackTrace.toString(), name: logName);
          return Container();
        },
      );
    } else {
      // If there's no image from firebase
      return CategoryImageCardBody(category);
    }
  }
}

class CategoryImageCardBody extends StatelessWidget {
  static const logName = 'category-image-card-body';
  const CategoryImageCardBody(
    this.category, {
    Key? key,
    this.image,
  }) : super(key: key);

  final Category category;
  final ImageProvider? image;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Stack(
      fit: StackFit.expand,
      children: [
        Image(
          image: image ??
              const AssetImage(
                iaDefaultCategoryImage,
              ),
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
                      horizontal: kHorizontalSpacing, vertical: kSpacing / 3),
                  child: FittedBox(
                    alignment: Alignment.center,
                    child: Text(category.name,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        // overflow: TextOverflow.fade,
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
      ],
    );
  }
}

class CategoryCard extends ConsumerWidget {
  static const logName = 'category-card';
  const CategoryCard(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (category.imagePath != null) {
      final imagePath = ref.watch(categoryListImageProvider(category));
      return imagePath.when(
          data: (data) => Image(
                image: NetworkImage(data!),
                height: kCardImageHeight,
                width: double.infinity,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.3),
                colorBlendMode: BlendMode.hardLight,
                frameBuilder: ((context, child, frame, wasSynchronouslyLoaded) {
                  return CategoryCardBody(category, image: child);
                }),
                loadingBuilder: ((context, child, loadingProgress) {
                  return LayoutBuilder(builder: (context, constraints) {
                    return (loadingProgress != null)
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ShimmeringBox(
                                height:
                                    constraints.maxHeight - kProgressBarHeight,
                              ),
                              LinearProgressBar(
                                  value: (loadingProgress.expectedTotalBytes !=
                                          null)
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null),
                            ],
                          )
                        : child;
                  });
                }),
              ),
          loading: () => const ShimmeringCard(height: kCardImageHeight * 1.5),
          error: (_, stackTrace) {
            log(stackTrace.toString(), name: logName);
            return Container(color: Colors.red);
          });
    } else {
      // If there's no image from firebase
      return CategoryCardBody(category);
    }
  }
}

class CategoryCardBody extends StatelessWidget {
  const CategoryCardBody(this.category, {this.image, super.key});
  final Category category;
  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            clipBehavior: Clip.hardEdge,
            child: image ??
                const Image(
                  image: AssetImage(iaDefaultCategoryImage),
                  height: kCardImageHeight,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
          ),
          ListTile(
            title: Text(category.name),
            leading: (category.isAutomotive)
                ? const Icon(icCategoriesAutomotive)
                : const Icon(icCategories),
            // subtitle: const Text('Has 4 items'),
          ),
        ],
      ),
    );
  }
}
