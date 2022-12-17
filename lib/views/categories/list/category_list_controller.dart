import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../backend/services/category_service.dart';
import 'category_list_state.dart';

class CategoryListController extends StateNotifier<CategoryListState> {
  CategoryListController(CategoryListState state, this._categoryService)
      : super(state) {
    loadCategories();
  }
  final CategoryService _categoryService;

  Future<void> loadCategories() async {
    state = state.copyWith(categories: const AsyncValue.loading());
    final result = _categoryService.getCategoriesOrderedByName();
    if (result != null) {
      state = state.copyWith(categories: AsyncValue.data(result));
    }
  }

  Future<String?> deleteCategory(Category category) {
    return _categoryService.deleteCategory(category);
  }
}

final categoryListControllerProvider =
    StateNotifierProvider<CategoryListController, CategoryListState>(
  (ref) => CategoryListController(
    CategoryListState(),
    ref.watch(categoryServiceProvider),
  ),
);

final categoryListImageProvider =
    FutureProvider.autoDispose.family<String?, Category>((ref, category) async {
  final result =
      await ref.watch(categoryServiceProvider).getImageUrl(category.imagePath);
  return result;
});
