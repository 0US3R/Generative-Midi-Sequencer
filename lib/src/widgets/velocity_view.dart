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

  int calculateVelocityFromButtonIndex(int buttonIndex) {
    return (gridStyle.velocityScaleStepNumber - buttonIndex) *
        gridStyle.velocityScaleStepSize;
  }

  bool isVelocityButtonActive(int buttonIndex) {
    if (step.velocity == 0) {
      return false;
    }
    final buttonVelocity = calculateVelocityFromButtonIndex(buttonIndex);

    return step.velocity >= buttonVelocity;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(gridStyle.velocityScaleStepNumber, (index) {
          return Expanded(
            child: Container(
              padding: gridStyle.getVelocityButtonPadding(
                isActive: step.active,
                hasSustain: step.sustain,
              ),
              child: ElevatedButton(
                style: gridStyle.getVelocityButtonStyle(
                  isActive: step.active,
                  isSelected: isVelocityButtonActive(index),
                ),
                onLongPress: SequencerCommandSetStepNote(
                  note: index,
                  stepIndex: stepIndex,
                  patternIndex: patternIndex,
                ).sendSignalToRust,
                onPressed: SequencerCommandSetStepVelocity(
                  velocity: calculateVelocityFromButtonIndex(index),
                  stepIndex: stepIndex,
                  patternIndex: patternIndex,
                ).sendSignalToRust,
                child: isVelocityButtonActive(index)
                    ? Text("I")
                    : Text("O"), // Better labeling
              ),
            ),
          );
        }),
      ),
    );
  }
}
