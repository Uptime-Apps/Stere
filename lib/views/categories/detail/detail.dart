import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/asset/asset.dart';
import '../../../backend/models/category/category.dart';
import '../../../backend/services/asset_service.dart';
import '../../../core/components/list_tiles/asset.dart';
import '../../../core/components/lists/chips.dart';
import '../../../core/components/lists/stream_list_view.dart';
import '../../../core/components/others/basic_scaffold.dart';
import '../../../core/components/others/images.dart';
import '../../../core/constants/icons.dart';
import '../../../l10n/generated/l10n.dart';
import '../../assets/form/asset_form.dart';
import '../../assets/providers.dart';

class CategoryDetailScreen extends ConsumerStatefulWidget {
  static const String route = 'category-detail';
  const CategoryDetailScreen(this.category, {super.key});
  final Category category;

  @override
  ConsumerState<CategoryDetailScreen> createState() =>
      _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends ConsumerState<CategoryDetailScreen> {
  late Future<List<Asset>>? assets;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    assets = ref
        .watch(assetServiceProvider)
        .getAssetsByCategory(widget.category.id!);
  }

  @override
  Widget build(BuildContext context) {
    final img = ref.watch(categoryImageProvider(widget.category.imagePath));
    return StereBasicScaffold(
      body: StreamListView<Asset>(
        stream: assets?.asStream() ?? const Stream.empty(),
        onData: (data) =>
            data?.map((e) => AssetListTile(e, showTags: true)).toList(),
        noContentMessage: S.of(context).msgNoRegisters(widget.category.name),
        noContentIcon: icAssets,
        noContentActionRoute: AssetForm.route,
        headerBuilder: (context, snapshot) => Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DetailScreenImage(img),
            ChipsOverflowBar(widget.category.tags)
          ],
        ),
      ),
      title: widget.category.name,
    );
  }
}
