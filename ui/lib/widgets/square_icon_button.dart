import 'package:flutter/material.dart';

class SquareIcon extends StatelessWidget {
  final List<IconData> icons;
  final Function() onPressed;
  final ButtonStyle buttonStyle;

  const SquareIcon({
    super.key,
    required this.icons,
    required this.onPressed,
    required this.buttonStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Expanded(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final calculatedIconSize = availableWidth / 4;
            return OutlinedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var icon in icons)
                      Icon(icon, size: calculatedIconSize),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
