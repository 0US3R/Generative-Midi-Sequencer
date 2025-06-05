import 'package:flutter/material.dart';
import 'package:generative_midi_sequencer/src/bindings/bindings.dart';
import 'package:generative_midi_sequencer/src/widgets/style.dart';

class TriggerView extends StatelessWidget {
  final int patternIndex;
  final int stepIndex;
  final GridStyle gridStyle;
  final SequencerStep step;

  const TriggerView({
    super.key,
    required this.step,
    required this.patternIndex,
    required this.stepIndex,
    required this.gridStyle,
  });

  @override
  Widget build(BuildContext context) {
    // FIX 7: Use flex to control space allocation in parent Column
    return Expanded(
      flex: 1,
      child: Container(
        padding: gridStyle.getTriggerButtonPadding(
          isActive: step.active,
          hasSustain: step.sustain,
        ),
        child: ElevatedButton(
          style: gridStyle.getTriggerButtonStyle(
            isActive: step.active,
            isCurrent: false,
          ),
          onLongPress: SequencerCommandToggleStepSustain(
            stepIndex: stepIndex,
            patternIndex: patternIndex,
          ).sendSignalToRust,
          onPressed: () {
            SequencerCommandToggleStep(
              stepIndex: stepIndex,
              patternIndex: patternIndex,
            ).sendSignalToRust();
          },
          child: step.active ? Text("I") : Text("O"), // Better labeling
        ),
      ),
    );
  }
}
