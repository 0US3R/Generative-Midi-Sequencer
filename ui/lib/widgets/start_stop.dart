import 'package:flutter/material.dart';
import 'package:ui/src/rust/app.dart';
import 'package:ui/widgets/square_icon_button.dart';

class StartStopButton extends StatelessWidget {
  final RustState rustState;

  const StartStopButton({super.key, required this.rustState});

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle;
    IconData iconData;

    if (rustState.isPlaying) {
      iconData = Icons.play_arrow;
      buttonStyle = OutlinedButton.styleFrom(
        padding:
            EdgeInsets.zero, // Remove default padding to center icon better
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        ), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
        ),
      );
    } else {
      iconData = Icons.stop;
      buttonStyle = OutlinedButton.styleFrom(
        padding:
            EdgeInsets.zero, // Remove default padding to center icon better
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
        ), // Border color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Slightly rounded corners
        ),
      );
    }

    return SquareIcon(
      icons: [iconData],
      onPressed: _onPressed,
      buttonStyle: buttonStyle,
    );
  }

  void _onPressed() {
    if (rustState.isPlaying) {
      rustState.stop();
      return;
    }
    rustState.start();
  }
}
