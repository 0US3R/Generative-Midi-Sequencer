import 'package:flutter/material.dart';

// Ensure your ColorScheme has these properties if you use them,
// or adjust to standard ColorScheme properties like primary, secondary, surface, etc.
// For demonstration, I'll use standard ones or mock them.
extension CustomColorScheme on ColorScheme {
  Color get secondaryFixed => primary; // Example mapping
  Color get secondaryFixedDim => primary.withOpacity(0.7); // Example mapping
  Color get surfaceContainerLowest => surface; // Example mapping
  Color get surfaceContainerHighest =>
      surface.withOpacity(0.9); // Fixed self-reference
}

class GridStyle {
  final ColorScheme colorScheme;

  // Trigger button styles
  final ButtonStyle triggerButtonStyleActiveAndCurrent;
  final ButtonStyle triggerButtonStyleActive;
  final ButtonStyle triggerButtonStyleCurrent;
  final ButtonStyle triggerButtonStyleDefault;
  final EdgeInsets triggerButtonPaddingDefault;
  final EdgeInsets triggerButtonPaddingActive;
  final EdgeInsets triggerButtonPaddingSustain;
  final EdgeInsets triggerButtonPaddingSustainAndActive;

  // Velocity button styles
  final ButtonStyle velocityButtonStyleActiveAndSelected;
  final ButtonStyle velocityButtonStyleActive;
  final ButtonStyle velocityButtonStyleSelected;
  final ButtonStyle velocityButtonStyleDefault;

  final EdgeInsets velocityButtonPaddingDefault;
  final EdgeInsets velocityButtonPaddingActive;
  final EdgeInsets velocityButtonPaddingSustain;
  final EdgeInsets velocityButtonPaddingSustainAndActive;

  // Scale properties
  final int velocityScaleStepSize;
  final int velocityScaleStepNumber;
  final int pitchScaleStepSize; // Fixed typo
  final int pitchScaleStepNumber;

  const GridStyle({
    required this.colorScheme,
    required this.triggerButtonStyleActiveAndCurrent,
    required this.triggerButtonStyleActive,
    required this.triggerButtonStyleCurrent,
    required this.triggerButtonStyleDefault,
    required this.triggerButtonPaddingDefault,
    required this.triggerButtonPaddingActive,
    required this.triggerButtonPaddingSustain,
    required this.triggerButtonPaddingSustainAndActive,
    required this.velocityButtonStyleActiveAndSelected,
    required this.velocityButtonStyleActive,
    required this.velocityButtonStyleSelected,
    required this.velocityButtonStyleDefault,
    required this.velocityButtonPaddingDefault,
    required this.velocityButtonPaddingActive,
    required this.velocityButtonPaddingSustain,
    required this.velocityButtonPaddingSustainAndActive,
    required this.velocityScaleStepSize,
    required this.velocityScaleStepNumber,
    required this.pitchScaleStepSize,
    required this.pitchScaleStepNumber,
  });

  ButtonStyle getTriggerButtonStyle({
    required bool isActive,
    required bool isCurrent,
  }) {
    if (isActive && isCurrent) return triggerButtonStyleActiveAndCurrent;
    if (isActive) return triggerButtonStyleActive;
    if (isCurrent) return triggerButtonStyleCurrent;
    return triggerButtonStyleDefault;
  }

  // Pure styling methods only - no business logic
  ButtonStyle getVelocityButtonStyle({
    required bool isActive,
    required bool isSelected,
  }) {
    if (isActive && isSelected) return velocityButtonStyleActiveAndSelected;
    if (isActive) return velocityButtonStyleActive;
    if (isSelected) return velocityButtonStyleSelected;
    return velocityButtonStyleDefault;
  }

  EdgeInsets getTriggerButtonPadding({
    required bool isActive,
    required bool hasSustain,
  }) {
    if (isActive && hasSustain) return triggerButtonPaddingSustainAndActive;
    if (isActive) return triggerButtonPaddingActive;
    if (hasSustain) return triggerButtonPaddingSustain;
    return triggerButtonPaddingDefault;
  }

  EdgeInsets getVelocityButtonPadding({
    required bool isActive,
    required bool hasSustain,
  }) {
    if (isActive && hasSustain) return velocityButtonPaddingSustainAndActive;
    if (isActive) return velocityButtonPaddingActive;
    if (hasSustain) return velocityButtonPaddingSustain;
    return velocityButtonPaddingDefault;
  }

  static GridStyle fromColorScheme(ColorScheme cs) {
    return GridStyle(
      colorScheme: cs,

      // Trigger button styles
      triggerButtonStyleActiveAndCurrent: ElevatedButton.styleFrom(
        backgroundColor: cs.primaryFixed,
        foregroundColor: cs.onPrimary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 2,
        visualDensity: VisualDensity.compact,
      ),
      triggerButtonStyleActive: ElevatedButton.styleFrom(
        backgroundColor: cs.surfaceBright,
        foregroundColor: cs.primary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 2,
        visualDensity: VisualDensity.compact,
      ),
      triggerButtonStyleCurrent: ElevatedButton.styleFrom(
        backgroundColor: cs.surfaceContainerLowest,
        foregroundColor: cs.onSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),
      triggerButtonStyleDefault: ElevatedButton.styleFrom(
        backgroundColor: cs.surfaceContainerHighest,
        foregroundColor: cs.onSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),

      // Trigger button padding
      triggerButtonPaddingDefault: const EdgeInsets.fromLTRB(0, 5, 2, 0),
      triggerButtonPaddingActive: const EdgeInsets.fromLTRB(0, 5, 2, 0),
      triggerButtonPaddingSustain: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      triggerButtonPaddingSustainAndActive: const EdgeInsets.fromLTRB(
        0,
        5,
        0,
        0,
      ),

      velocityButtonStyleActiveAndSelected: ElevatedButton.styleFrom(
        backgroundColor: cs.secondaryFixedDim,
        foregroundColor: cs.onPrimary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 5,
        visualDensity: VisualDensity.compact,
      ),
      velocityButtonStyleActive: ElevatedButton.styleFrom(
        backgroundColor: cs.surfaceBright,
        foregroundColor: cs.primary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),

      // SELECTED
      velocityButtonStyleSelected: ElevatedButton.styleFrom(
        backgroundColor: cs.secondaryFixed,
        foregroundColor: cs.primary,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 5,
        visualDensity: VisualDensity.compact,
      ),

      velocityButtonStyleDefault: ElevatedButton.styleFrom(
        backgroundColor: cs.surfaceContainerHighest,
        foregroundColor: cs.onSurface,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        elevation: 0,
        visualDensity: VisualDensity.compact,
      ),

      velocityButtonPaddingDefault: const EdgeInsets.fromLTRB(0, 0, 2, 0),
      velocityButtonPaddingActive: const EdgeInsets.fromLTRB(0, 0, 2, 0),
      velocityButtonPaddingSustain: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      velocityButtonPaddingSustainAndActive: const EdgeInsets.fromLTRB(
        0,
        0,
        0,
        0,
      ),

      // Scale properties
      velocityScaleStepNumber: 7,
      velocityScaleStepSize: 8,
      pitchScaleStepNumber: 7,
      pitchScaleStepSize: 8,
    );
  }
}
