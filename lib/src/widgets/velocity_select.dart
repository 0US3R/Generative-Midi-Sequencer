import 'package:flutter/material.dart';
import 'package:generative_midi_sequencer/src/bindings/bindings.dart';
import 'package:generative_midi_sequencer/src/widgets/style.dart';

class VelocitySelect extends StatelessWidget {
  final int patternIndex;
  final int stepIndex;
  final SequencerStep step;
  final GridStyle gridStyle;

  const VelocitySelect({
    super.key,
    required this.step,
    required this.patternIndex,
    required this.stepIndex,
    required this.gridStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: gridStyle.getPadding(
          isActive: step.active,
          hasSustain: step.sustain,
        ),
      ),
    );
  }
}
