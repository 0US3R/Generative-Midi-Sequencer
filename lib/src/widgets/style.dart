import 'package:flutter/material.dart';

// Ensure your ColorScheme has these properties if you use them,
// or adjust to standard ColorScheme properties like primary, secondary, surface, etc.
// For demonstration, I'll use standard ones or mock them.
extension CustomColorScheme on ColorScheme {
  Color get secondaryFixed => primary; // Example mapping
  Color get secondaryFixedDim => primary.withOpacity(0.7); // Example mapping
  Color get surfaceContainerLowest => surface; // Example mapping
  Color get surfaceContainerHighest =>
      surfaceContainerHighest; // Example mapping
}

class GridStyle {
  final ColorScheme colorScheme;
  final ButtonStyle buttonStyleActiveAndCurrent;
  final ButtonStyle buttonStyleActive;
  final ButtonStyle buttonStyleCurrent;
  final ButtonStyle buttonStyleDefault;
  final EdgeInsets buttonPaddingDefault;
  final EdgeInsets buttonPaddingActive;
  final EdgeInsets buttonPaddingSustainAndAcitve;

  final int velocityScaleStepSize;
  final int velocityScaleStepNumber;

  final int ptichScaleStepSize;
  final int pitchScaleStepNumber;

  final int patternIndex;

  const GridStyle({
    required this.colorScheme,
    required this.buttonStyleActiveAndCurrent,
    required this.buttonStyleActive,
    required this.buttonStyleCurrent,
    required this.buttonStyleDefault,
    required this.buttonPaddingDefault,
    required this.buttonPaddingActive,
    required this.buttonPaddingSustainAndAcitve,
    required this.pitchScaleStepNumber,
    required this.velocityScaleStepNumber,
    required this.velocityScaleStepSize,
    required this.ptichScaleStepSize,
    required this.patternIndex,
  });

  // Pure styling methods only - no business logic
  ButtonStyle getButtonStyle({
    required bool isActive,
    required bool isCurrent,
  }) {
    if (isActive && isCurrent) return buttonStyleActiveAndCurrent;
    if (isActive) return buttonStyleActive;
    if (isCurrent) return buttonStyleCurrent;
    return buttonStyleDefault;
  }

  EdgeInsets getPadding({required bool isActive, required bool hasSustain}) {
    if (isActive && hasSustain) return buttonPaddingSustainAndAcitve;
    if (isActive) return buttonPaddingActive;
    return buttonPaddingDefault;
  }

  /// Provides a default GridStyle instance based on the provided ColorScheme.
  /// You can customize these default values to match your app's design system.
  static GridStyle fromColorScheme(ColorScheme cs) {
    return GridStyle(
      colorScheme: cs,
      buttonStyleActiveAndCurrent: ElevatedButton.styleFrom(
        backgroundColor: cs.secondaryFixed, // Using your custom extension
        foregroundColor: cs.onSecondary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),
      buttonStyleActive: ElevatedButton.styleFrom(
        backgroundColor: cs.secondaryFixedDim, // Using your custom extension
        foregroundColor: cs.onSecondary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),
      buttonStyleCurrent: ElevatedButton.styleFrom(
        backgroundColor:
            cs.surfaceContainerLowest, // Using your custom extension
        foregroundColor: cs.onSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),
      buttonStyleDefault: ElevatedButton.styleFrom(
        backgroundColor:
            cs.surfaceContainerHighest, // Using your custom extension
        foregroundColor: cs.onSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),
      buttonPaddingDefault: const EdgeInsets.fromLTRB(0, 10, 5, 10),
      buttonPaddingActive: const EdgeInsets.fromLTRB(0, 0, 5, 0),
      buttonPaddingSustainAndAcitve: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      velocityScaleStepNumber: 8,
      velocityScaleStepSize: 1,
      pitchScaleStepNumber: 8,
      ptichScaleStepSize: 1,

      patternIndex: 0,
    );
  }
}
