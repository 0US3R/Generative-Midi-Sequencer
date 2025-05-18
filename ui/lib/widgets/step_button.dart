import 'package:flutter/material.dart';
import 'package:ui/widgets/square_icon_button.dart';

const color_1 = Colors.red;
const color_2 = Colors.green;
const color_3 = Colors.grey;

// --- Individual Step Button Widget ---
class StepButton extends StatelessWidget {
  final bool isActive;
  final bool isCurrentStep;
  final VoidCallback onTap;
  final int step;

  const StepButton({
    super.key,
    required this.isActive,
    required this.isCurrentStep,
    required this.onTap,
    required this.step,
  });

  @override
  Widget build(BuildContext context) {
    return SquareIcon(
      icons: [Icons.abc],
      onPressed: () {},
      buttonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.focused)) return Colors.red;
          if (states.contains(WidgetState.pressed)) return Colors.red;
          if (this.isActive) return Colors.green;
          return Colors.transparent; // Defer to the widget's default.
        }),
      ),
    );
  }
}
