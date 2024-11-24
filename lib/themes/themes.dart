import 'package:flutter/material.dart';

abstract class CustomTheme {
  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF7D8A98),  // Soft dusty blue
    onPrimary: Color(0xFFFFFFFF),  // White
    primaryContainer: Color(0xFFD2E1E6),  // Light pastel blue
    onPrimaryContainer: Color(0xFF2A3A44),  // Darker blue-gray
    secondary: Color(0xFFB1B8C1),  // Light grayish blue
    onSecondary: Color(0xFFFFFFFF),  // White
    secondaryContainer: Color(0xFFE2E8F1),  // Pale gray-blue
    onSecondaryContainer: Color(0xFF2A3A44),  // Dark blue-gray
    tertiary: Color(0xFFB3B8A3),  // Soft muted green
    onTertiary: Color(0xFFFFFFFF),  // White
    tertiaryContainer: Color(0xFFD5E2C1),  // Soft pastel green
    onTertiaryContainer: Color(0xFF2B3927),  // Dark green
    error: Color(0xFFB00020),  // Subtle red
    errorContainer: Color(0xFFFFDAD6),  // Soft pink background for error
    onError: Color(0xFFFFFFFF),  // White
    onErrorContainer: Color(0xFF370000),  // Dark red for error messages
    background: Color(0xFFF7F7F7),  // Light off-white background
    onBackground: Color(0xFF2A2A2A),  // Dark gray for text
    surface: Color(0xFFF7F7F7),  // Light off-white surface
    onSurface: Color(0xFF2A2A2A),  // Dark gray for text
    surfaceVariant: Color(0xFFDEE2E6),  // Light pastel gray surface
    onSurfaceVariant: Color(0xFF4A4A4A),  // Dark gray for text
    outline: Color(0xFFB3B3B3),  // Light gray outline for borders
    onInverseSurface: Color(0xFFFBFBFB),  // White text for inverse surfaces
    inverseSurface: Color(0xFF303030),  // Darker background for inverse surfaces
    inversePrimary: Color(0xFF3C5D6F),  // Soft blue-gray for inverse primary
    shadow: Color(0xFF000000),  // Black shadow
    surfaceTint: Color(0xFF7D8A98),  // Soft dusty blue
    outlineVariant: Color(0xFFB3B3B3),  // Light gray outline
    scrim: Color(0xFF000000),  // Black scrim
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF7D8A98),  // Soft dusty blue
    onPrimary: Color(0xFF1F2A33),  // Darker blue-gray for text
    primaryContainer: Color(0xFF3C515B),  // Darker shade of blue for containers
    onPrimaryContainer: Color(0xFFD2E1E6),  // Light pastel blue
    secondary: Color(0xFFB1B8C1),  // Light grayish blue
    onSecondary: Color(0xFF1F2A33),  // Dark gray for text
    secondaryContainer: Color(0xFF4B5A66),  // Darker gray-blue
    onSecondaryContainer: Color(0xFFDEE2E6),  // Soft light gray
    tertiary: Color(0xFF8A9A77),  // Muted olive green
    onTertiary: Color(0xFF2B3927),  // Dark green
    tertiaryContainer: Color(0xFF2F3F2D),  // Dark olive green
    onTertiaryContainer: Color(0xFFD5E2C1),  // Soft pastel green
    error: Color(0xFFB00020),  // Subtle red for errors
    errorContainer: Color(0xFF370000),  // Dark red background for error
    onError: Color(0xFFFFFFFF),  // White text on error
    onErrorContainer: Color(0xFF370000),  // Dark red for error messages
    background: Color(0xFF121212),  // Darker background for dark mode
    onBackground: Color(0xFFE0E0E0),  // Light gray text for dark mode
    surface: Color(0xFF121212),  // Darker surface for dark mode
    onSurface: Color(0xFFE0E0E0),  // Light gray text on surfaces
    surfaceVariant: Color(0xFF3C4349),  // Darker gray surface variant
    onSurfaceVariant: Color(0xFFB3B3B3),  // Lighter gray for surface variant text
    outline: Color(0xFF8A8A8A),  // Soft gray outline
    onInverseSurface: Color(0xFF121212),  // Darker background for inverse surface
    inverseSurface: Color(0xFFE0E0E0),  // Light background for inverse surface
    inversePrimary: Color(0xFF3C5D6F),  // Soft blue-gray for inverse primary
    shadow: Color(0xFF000000),  // Black shadow
    surfaceTint: Color(0xFF7D8A98),  // Soft dusty blue for tint
    outlineVariant: Color(0xFF8A8A8A),  // Soft gray outline
    scrim: Color(0xFF000000),  // Black scrim
  );
}
