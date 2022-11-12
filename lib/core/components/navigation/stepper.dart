import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    this.controls,
    this.onStepCancel,
    this.onStepContinue,
    this.onStepTapped,
  }) : super(key: key);
  final List<Step> steps;
  final List<Widget> Function(BuildContext context, ControlsDetails details)?
      controls;
  final int currentStep;
  final void Function()? onStepCancel;
  final void Function()? onStepContinue;
  final void Function(int)? onStepTapped;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      margin: const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
      onStepTapped: onStepTapped,
      controlsBuilder: controls != null
          ? (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: kVerticalSpacing),
                child: Row(
                  children: controls!(context, details),
                ),
              );
            }
          : null,
      currentStep: currentStep,
      onStepContinue: onStepContinue,
      onStepCancel: onStepCancel,
      steps: steps,
      type: StepperType.vertical,
    );
  }
}
