import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/services/asset_service.dart';
import 'asset_list_state.dart';

class AssetListController extends StateNotifier<AssetListState> {
  AssetListController(AssetListState state, this._service) : super(state) {
    load();
  }
  final AssetService _service;

  Future<void> load() async {
    state = state.copyWith(assets: const AsyncValue.loading());
    final result = _service.getAssetsOrderedByName();
    if (result != null) {
      state = state.copyWith(assets: AsyncValue.data(result));
    }
  }

  Future<void> deleteAsset(Asset asset) {
    return _service.delete(asset);
  }
}

final assetListControllerProvider =
    StateNotifierProvider<AssetListController, AssetListState>(
  (ref) => AssetListController(
    AssetListState(),
    ref.watch(assetServiceProvider),
  ),
);

final assetListImageProvider =
    FutureProvider.autoDispose.family<String?, String?>((ref, imagePath) async {
  final result = await ref.watch(assetServiceProvider).getImageUrl(imagePath);
  return result;
});
