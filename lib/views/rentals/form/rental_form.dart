import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'steps/step_client_details.dart';

import '../../../core/components/navigation/stepper.dart';
import '../../../core/components/others/basic_scaffold.dart';
import '../../../core/components/others/filled_button.dart';
import '../../../core/components/others/utilities.dart';
import '../../../core/constants/spacing_values.dart';
import '../../../l10n/generated/l10n.dart';
import 'steps/available_assets/step_available_assets.dart';
import 'rental_form_controller.dart';
import 'steps/step_final_review.dart';

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
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: kVerticalSpacing),
          child: Form(key: prov.formKey, child: const RentalFormStepper()),
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
      buttonsAlignment: (prov.currentStep == 2)
          ? MainAxisAlignment.center
          : MainAxisAlignment.start,
      finalStepNoMargin: true,
      onStepTapped: (step) => (step != 2) ? notifier.setStep(step) : null,
      controls: (context, details) => [
        Expanded(
          child: FilledButton(
            onPressed: prov.validForm ? details.onStepContinue! : null,
            label: Text((prov.currentStep == 2)
                ? S.of(context).lblCreateObject(S.of(context).lblRentals(1))
                : S.of(context).lblConfirm),
          ),
        ),
        if (prov.currentStep != 2) ...{
          const DefaultSpacer(),
          Flexible(
            child: TextButton(
              onPressed: details.onStepCancel!,
              child: Text(S.of(context).lblCancel),
            ),
          ),
        }
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
          title: Text(S.of(context).stepClientDetails),
          content: const StepClientDetails(),
          state: validStepState(notifier.validStepClientDetails()),
        ),
        Step(
          isActive: prov.currentStep == 2,
          title: Text(S.of(context).stepFinalReview),
          content: const StepFinalReview(),
          state: validStepState(notifier.validStepClientDetails()),
        ),
      ],
    );
  }

  StepState validStepState(bool result) =>
      result ? StepState.complete : StepState.indexed;
}
