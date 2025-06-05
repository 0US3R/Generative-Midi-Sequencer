import 'package:flutter/material.dart';
import 'package:generative_midi_sequencer/src/bindings/bindings.dart';
import 'package:generative_midi_sequencer/src/widgets/style.dart';
import 'package:generative_midi_sequencer/src/widgets/trigger_view.dart';
import 'package:generative_midi_sequencer/src/widgets/velocity_view.dart';

class StepGrid extends StatefulWidget {
  final GridStyle gridStyle;

  const StepGrid({super.key, required this.gridStyle});

  @override
  State<StepGrid> createState() => _StepGridState();
}

class _StepGridState extends State<StepGrid> {
  bool _showVelocityView = false;
  final int patternIndex = 0;

  void toggleVelocityView(int stepIndex) {
    setState(() {
      if (_showVelocityView) {
        _showVelocityView = false;
      } else {
        _showVelocityView = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var grid = StreamBuilder(
      stream: SequencerState.rustSignalStream,
      builder: (context, snapshot) {
        final signalPack = snapshot.data;
        if (signalPack == null) {
          return Text('Initial value 0');
        }
        final state = signalPack.message;
        final pattern = state.patterns[patternIndex];

        // FIX 1: Wrap the Row in Expanded to give it proper constraints
        return Row(
          //` crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            pattern.steps.length,
            (index) => Expanded(
              // FIX 2: Each column should be Expanded within the Row
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildVelocityWidget(pattern.steps[index], index),
                  _buildTriggerWidget(pattern.steps[index], index),
                ],
              ),
            ),
          ),
        );
      },
    );
    return grid;
  }

  Widget _buildVelocityWidget(SequencerStep step, int stepIndex) {
    // FIX 3: Remove extra Expanded wrapper - VelocityView handles its own expansion
    return VelocityView(
      step: step,
      patternIndex: patternIndex,
      stepIndex: stepIndex,
      gridStyle: widget.gridStyle,
    );
  }

  Widget _buildTriggerWidget(SequencerStep step, int stepIndex) {
    // FIX 4: Remove extra Expanded wrapper - TriggerView handles its own expansion
    return TriggerView(
      step: step,
      patternIndex: patternIndex,
      stepIndex: stepIndex,
      gridStyle: widget.gridStyle,
    );
  }
}
