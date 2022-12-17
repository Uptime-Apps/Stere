import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../backend/services/asset_service.dart';
import '../../../backend/services/category_service.dart';
import 'category_detail_state.dart';

final categoryDetailControllerProvider =
    StateNotifierProvider<CategoryDetailController, CategoryDetailState>(
  (ref) => CategoryDetailController(
    CategoryDetailState(
      assets: const AsyncValue.loading(),
      category: const AsyncValue.loading(),
    ),
    assetService: ref.watch(assetServiceProvider),
    categoryService: ref.watch(categoryServiceProvider),
  ),
);

class CategoryDetailController extends StateNotifier<CategoryDetailState> {
  CategoryDetailController(CategoryDetailState state,
      {required this.categoryService, required this.assetService})
      : super(state);

  final CategoryService categoryService;
  final AssetService assetService;

  void load(Category category) {
    state = state.copyWith(
      category: AsyncValue.data(category),
    );
    assetService.getAssetsByCategory(category.id!)?.then(
        (value) => state = state.copyWith(assets: AsyncValue.data(value)));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
