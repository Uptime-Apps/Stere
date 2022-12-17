import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/category/category.dart';

part 'category_detail_state.freezed.dart';

@freezed
class CategoryDetailState with _$CategoryDetailState {
  factory CategoryDetailState({
    required AsyncValue<Category> category,
    required AsyncValue<List<Asset>?> assets,
  }) = _CategoryDetailState;
}
