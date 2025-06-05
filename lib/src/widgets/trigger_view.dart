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
        padding: gridStyle.getPadding(
          isActive: step.active,
          hasSustain: step.sustain,
        ),
        child: ElevatedButton(
          style: gridStyle.getButtonStyle(
            isActive: step.active,
            isCurrent: false,
          ),
          onPressed: () {
            SequencerCommandToggleStep(
              stepIndex: stepIndex,
              patternIndex: patternIndex,
            ).sendSignalToRust();
          },
          child: Text("T$stepIndex"), // Better labeling
        ),
      ),
    );
  }
}
