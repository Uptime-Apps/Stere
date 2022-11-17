import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/navigation/stepper.dart';
import '../../../core/components/others/basic_scaffold.dart';
import '../../../core/components/others/filled_button.dart';
import '../../../core/components/others/utilities.dart';
import '../../../core/constants/spacing_values.dart';
import '../../../l10n/generated/l10n.dart';
import '../old_form/steps/step_available_assets.dart';
import '../old_form/steps/step_rental_information.dart';
import 'rental_form_controller.dart';

class RentalForm extends ConsumerWidget {
  static const route = 'rental-form';
  const RentalForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var prov = ref.watch(rentalFormControllerProvider);
    return StereBasicScaffold(
        title: S.of(context).lblCreateObject(S.of(context).lblRentals(1)),
        leading: IconButton(
          onPressed: () =>
              ref.read(rentalFormControllerProvider.notifier).exitForm(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
            child: Form(key: prov.formKey, child: const RentalFormStepper()),
          ),
        ),
        trailing: [
          IconButton(
            onPressed: () => showDialog(
                context: context,
                builder: (context) => SimpleDialog(
                      title: Text(S.of(context).stInformationDialogNewRental),
                      contentPadding: const EdgeInsets.all(kSpacing * 1.5),
                      children: [
                        Text(S.of(context).stInformationDialogNewRentalDelete),
                        const Divider(),
                        Text(S.of(context).stInformationDialogNewRentalEdit)
                      ],
                    )),
            icon: const Icon(Icons.help),
          )
        ]);
  }
}

class RentalFormStepper extends ConsumerWidget {
  const RentalFormStepper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prov = ref.watch(rentalFormControllerProvider);
    final notifier = ref.read(rentalFormControllerProvider.notifier);
    return VerticalStepper(
      finalStepNoMargin: true,
      onStepTapped: (prov.validForm) ? (step) => notifier.setStep(step) : null,
      controls: (context, details) => [
        FilledButton(
          onPressed: prov.validForm ? details.onStepContinue! : null,
          label: Text(S.of(context).lblConfirm),
        ),
        const DefaultSpacer(),
        TextButton(
          onPressed: details.onStepCancel!,
          child: Text(S.of(context).lblCancel),
        ),
      ],
      currentStep: prov.currentStep,
      onStepContinue: () => notifier.nextStep(context),
      onStepCancel: () => notifier.cancelStep(context),
      steps: [
        Step(
          isActive: prov.currentStep == 0,
          title: Text(S.of(context).stepAvailableAssets),
          content: prov.assets.when(
            data: (data) => StepAvailableAssets(data),
            error: (error, __) {
              return Text(error.toString());
            },
            loading: () => const CircularProgressIndicator(),
          ),
          state: validStepState(notifier.validStepAvailableAssets()),
        ),
        Step(
          isActive: prov.currentStep == 1,
          title: Text(S.of(context).stepRentalInformation),
          content: const StepRentalInformation(),
          // state: validStepState(notifier.validStepRentalInformation()),
        ),
      ],
    );
  }

  StepState validStepState(bool result) =>
      result ? StepState.complete : StepState.indexed;
}
