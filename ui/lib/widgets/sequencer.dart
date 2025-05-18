import 'package:flutter/material.dart';
import 'package:ui/widgets/step_button.dart';

class Sequencer extends StatefulWidget {
  const Sequencer({super.key});

  @override
  State<StatefulWidget> createState() => _SequencerState();
}

class _SequencerState extends State<Sequencer> {
  int currentStep = 0;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        children: List.generate(16, (index) {
          return StepButton(
            isActive: false,
            isCurrentStep: false,
            onTap: () {},
            step: index + 1,
          );
        }),
      ),
    );
  }
}
