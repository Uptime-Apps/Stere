import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../backend/models/asset/asset.dart';

part 'asset_list_state.freezed.dart';

@freezed
class AssetListState with _$AssetListState {
  factory AssetListState({
    AsyncValue<Future<List<Asset>>>? assets,
  }) = _AssetListState;
}
