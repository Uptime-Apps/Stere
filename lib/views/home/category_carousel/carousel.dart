import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../core/components/cards/call_to_action_card.dart';
import '../../../core/components/cards/category_card.dart';
import '../../../core/components/others/shimmers.dart';
import '../../../core/components/others/utilities.dart';
import '../../../core/constants/spacing_values.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/snackbar.dart';
import '../../categories/detail/detail.dart';
import '../../categories/form/category_form.dart';
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
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent: MediaQuery.of(context).size.width / 2.5,
                      clipBehavior: Clip.none,
                      children: snapshot.data!
                          .map((e) => ClickableCategoryCard(e))
                          .toList(),
                    );
                  },
                );
              },
              orElse: () => const CategoryCarouselLoading())
          : const CategoryCarouselLoading(),
    );
  }
}

class ClickableCategoryCard extends StatefulWidget {
  const ClickableCategoryCard(this.category, {super.key});
  final Category category;

  @override
  State<ClickableCategoryCard> createState() => _ClickableCategoryCard();
}

class _ClickableCategoryCard extends State<ClickableCategoryCard> {
  late Offset tapXY;
  late RenderBox overlay;
  @override
  Widget build(BuildContext context) {
    overlay = (Overlay.of(context)!.context.findRenderObject() as RenderBox?)!;
    return GestureDetector(
      onTapDown: getPosition,
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryDetailScreen.route,
          arguments: widget.category,
        );
      },
      onLongPress: () {
        HapticFeedback.mediumImpact();
        showMenu(
          context: context,
          items: <PopupMenuEntry<int>>[
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              value: 0,
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.edit),
                visualDensity: VisualDensity.compact,
                title: Text(S.of(context).lblEdit),
              ),
            ),
            PopupMenuItem(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              value: 1,
              child: ListTile(
                horizontalTitleGap: 0,
                leading: const Icon(Icons.delete),
                visualDensity: VisualDensity.compact,
                title: Text(S.of(context).lblDelete),
              ),
            )
          ],
          position: relRectSize,
        ).then((value) {
          switch (value) {
            case 0:
              break;
            case 1:
              showDialog(
                // add the key from the home screen
                context: context,
                builder: (context) => DeleteCategoryDialog(widget.category),
              );
              break;
            default:
              break;
          }
        });
      },
      child: CategoryImageCard(widget.category),
    );
  }

  // ↓ create the RelativeRect from size of screen and where you tapped
  RelativeRect get relRectSize =>
      RelativeRect.fromSize(tapXY & const Size(40, 40), overlay.size);

  // ↓ get the tap position Offset
  void getPosition(TapDownDetails detail) {
    tapXY = detail.globalPosition;
  }
}

class DeleteCategoryDialog extends ConsumerWidget {
  const DeleteCategoryDialog(this.category, {super.key});
  final Category category;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lang = S.of(context);
    return ConfirmationDialog(
      onSuccess: () async {
        final result = await ref
            .read(homeControllerProvider.notifier)
            .deleteCategory(category);
        showSimpleSnackbar((result == null)
            ? lang.msgFailedDeleteObject(lang.lblCategories(1))
            : lang.msgSuccessDeleteObject(category.name));
      },
      icon: Icons.delete,
      content: S.of(context).msgWarningDeleteCategory,
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
      children: List<Widget>.generate(4, (_) => const ShimmeringCard()),
    );
  }
}
