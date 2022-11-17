import 'package:flutter/material.dart';

import '../../constants/spacing_values.dart';

class VerticalStepper extends StatelessWidget {
  const VerticalStepper({
    Key? key,
    required this.currentStep,
    required this.steps,
    this.finalStepNoMargin = false,
    this.controls,
    this.onStepCancel,
    this.onStepContinue,
    this.buttonsAlignment = MainAxisAlignment.start,
    this.onStepTapped,
  }) : super(key: key);
  final List<Step> steps;
  final List<Widget> Function(BuildContext context, ControlsDetails details)?
      controls;
  final int currentStep;
  final bool finalStepNoMargin;
  final MainAxisAlignment buttonsAlignment;
  final void Function()? onStepCancel;
  final void Function()? onStepContinue;
  final void Function(int)? onStepTapped;

  @override
  Widget build(BuildContext context) {
    final horizontalMargin =
        !(finalStepNoMargin && currentStep == steps.length - 1)
            ? kSpacing * 3
            : 0.0;
    return Stepper(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 0),
      onStepTapped: onStepTapped,
      controlsBuilder: controls != null
          ? (context, details) {
              return Padding(
                padding: const EdgeInsets.only(top: kVerticalSpacing),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: buttonsAlignment,
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
