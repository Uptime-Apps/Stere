import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/category/category.dart';

part 'category_list_state.freezed.dart';

@freezed
class CategoryListState with _$CategoryListState {
  factory CategoryListState({
    AsyncValue<Stream<List<Category>>>? categories,
    AsyncValue<Stream<List<Asset>>>? categoryAssets,
  }) = _CategoryListState;
}
