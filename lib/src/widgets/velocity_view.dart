import 'package:flutter/material.dart';
import 'package:generative_midi_sequencer/src/bindings/bindings.dart';
import 'package:generative_midi_sequencer/src/widgets/style.dart';

class VelocityView extends StatelessWidget {
  final SequencerStep step;
  final int patternIndex;
  final int stepIndex;
  final GridStyle gridStyle;

  const VelocityView({
    super.key,
    required this.step,
    required this.patternIndex,
    required this.stepIndex,
    required this.gridStyle,
  });

  int calculateVelocityFromButtonIndex(
    int buttonIndex,
    int scaleStepNumber,
    int scaleStepSize,
  ) {
    return (scaleStepNumber - buttonIndex - 1) * scaleStepSize;
  }

  bool isVelocityButtonActive(
    int buttonIndex,
    int velocityScaleStepNumber,
    int velocityScaleStepSize,
  ) {
    if (step.velocity == 0) {
      return false;
    }
    final buttonVelocity = calculateVelocityFromButtonIndex(
      buttonIndex,
      velocityScaleStepNumber,
      velocityScaleStepSize,
    );

    return step.velocity >= buttonVelocity;
  }

  @override
  Widget build(BuildContext context) {
    // FIX 5: Use flex to control space allocation in parent Column
    return Expanded(
      flex: 3, // Takes 3/4 of the space in the parent Column
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(gridStyle.velocityScaleStepNumber, (
          velocityIndex,
        ) {
          return Expanded(
            child: Container(
              padding: gridStyle.getPadding(
                isActive: step.active,
                hasSustain: step.sustain,
              ),
              child: ElevatedButton(
                style: gridStyle.getButtonStyle(
                  isActive: step.active,
                  isCurrent: true,
                ),
                onPressed: () {
                  SequencerCommandSetStepVelocity(
                    velocity: velocityIndex,
                    stepIndex: stepIndex,
                    patternIndex: patternIndex,
                  ).sendSignalToRust();
                },
                child: Text("V$velocityIndex"), // Better labeling
              ),
            ),
          );
        }),
      ),
    );
  }
}
