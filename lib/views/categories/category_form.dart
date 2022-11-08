import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/components/inputs/tag_input.dart';
import '../../core/components/others/basic_scaffold.dart';
import '../../core/components/others/filled_button.dart';
import '../../core/components/inputs/image_picker.dart';
import '../../core/components/others/utilities.dart';
import '../../core/constants/spacing_values.dart';
import '../../l10n/generated/l10n.dart';
import '../../routes/navigation_controller.dart';
import '../../utils/validators.dart';
import 'category_form_controller.dart';

class CategoryForm extends ConsumerWidget {
  static const String route = 'category-form';
  const CategoryForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(categoryFormControllerProvider);
    final notifier = ref.read(categoryFormControllerProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;
    final formItems = [
      StereImagePicker(
        height: MediaQuery.of(context).size.height / 3,
        onImageObtained: (file) {
          notifier.setImage(file);
        },
        extraIconButtons: [
          IconButton(
            icon: Icon(
              Icons.local_gas_station,
              color: (prov.isAutomotive)
                  ? colorScheme.error
                  : colorScheme.secondary,
            ),
            tooltip: S.of(context).msgAutomotive,
            onPressed: () => notifier.toggleWithMiliage(!prov.isAutomotive),
          )
        ],
        header: TextFormField(
          maxLines: 1,
          textAlignVertical: TextAlignVertical.center,
          controller: prov.nameController,
          textCapitalization: TextCapitalization.words,
          style: Theme.of(context).textTheme.headline5,
          autofocus: true,
          validator: requiredFieldValidation,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.text_format),
            contentPadding: const EdgeInsets.only(left: kSpacing),
            hintText: S.current.lblName,
            border: InputBorder.none,
          ),
        ),
      ),
      TagInputField(
        onChange: (tags) => notifier.setTags(tags),
        tagController: prov.tagController,
        errorText: prov.errorText,
      ),
    ];
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
              margin: const EdgeInsets.only(bottom: kSpacing),
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  await notifier.submit(context);
                  if (prov.result.hasValue) {
                    ref
                        .read(navigationControllerProvider.notifier)
                        .setCurrentIndex(0);
                  }
                },
                label: prov.result.maybeWhen(
                  loading: () => const FilledButtonCircularProgressIndicator(),
                  orElse: () => Text(S.current.lblSave),
                ),
              ),
            )
          ],
        ),
      ),
      title: S.of(context).lblCreateObject(S.of(context).lblCategories(1)),
    );
  }
}
