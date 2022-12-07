import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../backend/models/category/category.dart';
import '../../../core/components/inputs/form_fields.dart';
import '../../../core/components/inputs/image_picker.dart';
import '../../../core/components/others/basic_scaffold.dart';
import '../../../core/components/others/filled_button.dart';
import '../../../core/components/others/shimmers.dart';
import '../../../core/components/others/utilities.dart';
import '../../../core/constants/spacing_values.dart';
import '../../../l10n/generated/l10n.dart';
import '../../../utils/validators.dart';
import '../providers.dart';
import 'asset_form_controller.dart';
import 'asset_form_state.dart';

class AssetForm extends ConsumerWidget {
  static const route = 'asset-form';
  const AssetForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(assetFormControllerProvider);
    final notifier = ref.read(assetFormControllerProvider.notifier);
    final formItems = formStructure(context, prov, notifier);
    return StereBasicScaffold(
      body: Form(
        key: prov.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (_, index) => formItems[index],
                itemCount: formItems.length,
                separatorBuilder: (_, __) => const DefaultSpacer(),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: kSpacing),
              child: FilledButton(
                onPressed: () => notifier.submit(context),
                label: prov.result.maybeWhen(
                  loading: () => const FilledButtonCircularProgressIndicator(),
                  orElse: () => Text(S.current.lblSave),
                ),
              ),
            )
          ],
        ),
      ),
      title: S.of(context).lblCreateObject(S.of(context).lblAssets(1)),
    );
  }

  List<Widget> formStructure(BuildContext context, AssetFormState state,
      AssetFormController controller) {
    return [
      StereImagePicker(
        height: MediaQuery.of(context).size.height / 3,
        onImageObtained: (file) {
          controller.setImage(file);
        },
        header: TextFormField(
          controller: state.nameController,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.headline4,
          autofocus: true,
          validator: requiredFieldValidation,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.text_format),
            hintText: S.current.lblName,
            border: InputBorder.none,
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          state.categories.when<Widget>(
            data: (categories) {
              return StreamBuilder(
                  builder: (context, categories) {
                    if (categories.hasData && categories.data!.isNotEmpty) {
                      return SelectFormField<Category>(
                        items: categories.data!
                            .map(
                              (e) => DropdownMenuItem(
                                  value: e, child: Text(e.name)),
                            )
                            .toList(),
                        onChanged: (category) {
                          controller.chooseCategory(category);
                        },
                        hint: S.of(context).lblCategories(2),
                        validator: (choice) =>
                            (choice == null) ? S.current.emFieldRequired : null,
                        icon: (state.chosenCategory.asData != null &&
                                state.chosenCategory.asData!.value.isAutomotive)
                            ? Icons.local_gas_station
                            : Icons.category,
                      );
                    }
                    return const Text('No categories');
                  },
                  stream: categories);
            },
            error: (_, st) {
              log(st.toString(), name: route);
              return const ShimmeringInput();
            },
            loading: () => const ShimmeringInput(),
          ),
          state.chosenCategory.when(
            data: (choice) => Wrap(
              spacing: kSpacing,
              children: choice.tags.map((e) {
                final selected = state.selectedTags.contains(e);
                return FilterChip(
                  label: Text(e),
                  selected: selected,
                  onSelected: (status) => controller.updateTagStatus(e, status),
                  side: (selected)
                      ? const BorderSide(style: BorderStyle.none)
                      : null,
                );
              }).toList(),
            ),
            error: (_, error) => Text(error.toString()),
            loading: () => const SizedBox(),
          ),
        ],
      ),
      MoneyInputField(
        controller: state.priceController,
        errorText: state.priceErrorText,
        label: S.of(context).ilPrice,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).emFieldRequired;
          }
          return (double.parse(value) <= 0)
              ? S.of(context).emInvalidPrice
              : null;
        },
      ),
    ];
  }
}
