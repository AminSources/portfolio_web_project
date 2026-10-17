import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Brightness brightness = Brightness.dark;

  static const Color primary = Color(0xFFE6B78B);
  static const Color onPrimary = Color(0xFF18100B);

  static const Color secondary = Color(0xFFFFD7AC);
  static const Color onSecondary = Color(0xFF100E0D);

  static const Color surface = Color(0xFF151210);
  static const Color onSurface = Color(0xFFF3EEE8);

  static const Color error = Color(0xFFCF6679);
  static const Color onError = Color(0xFF000000);

  static const Color voidSoft = Color(0xFF100E0D);
  static const Color muted = Color(0xFFA59B91);
  static const Color dim = Color(0xFF746A62);
  static const Color line = Color(0x26EEDFCF);
  static const Color navLink = Color(0xFFBCB2A8);
  static const Color heroCopy = Color(0xFFB4AAA0);
  static const Color skillTag = Color(0xFFD0C5BA);
  static const Color contactDetail = Color(0xFFD7CDC3);

  static const Color statusOnline = Color(0xFFB4C99B);
  static const Color artOrange = Color(0xFFB86F42);
  static const Color artGreenDark = Color(0xFF34403D);
  static const Color artGreenLight = Color(0xFFC0D5B4);
  static const Color planetHighlight = Color(0xFFFFE0B3);

  static const String _sans = 'Manrope';
  static const String _serif = 'Georgia';
  static const String _mono = 'DM Mono';

  static ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: const Color(0xFF090908), // --void
    colorScheme: const ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      error: error,
      onError: onError,
      surface: surface,
      onSurface: onSurface,
    ),
    dividerColor: line,
    hintColor: dim,

    //* widgets theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(primary),
        foregroundColor: WidgetStatePropertyAll(onPrimary),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
        iconColor: WidgetStatePropertyAll(onPrimary),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(foregroundColor: WidgetStatePropertyAll(primary)),
    ),

    //* text theme
    textTheme: const TextTheme(
      // Hero Section
      displayLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 50,
        fontWeight: FontWeight.w600,
        letterSpacing: -1.75,
        color: onSurface,
        height: 1.04,
      ),
      displayMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 72,
        fontWeight: FontWeight.w600,
        letterSpacing: -5.04, // -0.07em
        color: onSurface,
        height: 1.08,
      ),
      displaySmall: TextStyle(
        fontFamily: _sans,
        fontSize: 60,
        fontWeight: FontWeight.w600,
        letterSpacing: -4.2, // -0.07em
        color: onSurface,
        height: 1.08,
      ),

      // Section Headings & Lead Text
      headlineLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 48,
        fontWeight: FontWeight.w600,
        letterSpacing: -3.36,
        color: onSurface,
        height: 1.1,
      ),
      headlineMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 19,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.57, // -0.03em
        color: onSurface,
        height: 1.65,
      ),
      headlineSmall: TextStyle(
        fontFamily: _sans,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.64, // -0.04em
        color: onSurface,
        height: 1.4,
      ),

      // Body & Paragraphs
      bodyLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: heroCopy,
        height: 1.9,
      ),
      bodyMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: muted,
        height: 2.0,
      ),
      bodySmall: TextStyle(
        fontFamily: _sans,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        color: muted,
        height: 1.7,
      ),

      // Labels, Eyebrows & Meta (Mono Font)
      labelLarge: TextStyle(
        fontFamily: _mono,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.43, // 0.13em
        color: primary,
      ),
      labelMedium: TextStyle(
        fontFamily: _mono,
        fontSize: 9,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.17, // 0.13em
        color: primary,
      ),
      labelSmall: TextStyle(
        fontFamily: _mono,
        fontSize: 8,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.04, // 0.13em
        color: dim,
      ),

      // Specialized Styles (Mapped to closest M3 tokens)
      titleLarge: TextStyle(
        fontFamily: _serif,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        fontSize: 48,
        letterSpacing: -3.12, // -0.065em
        color: primary,
      ),
      titleMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: navLink,
        height: 1.5,
      ),
      titleSmall: TextStyle(
        fontFamily: _sans,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: skillTag,
        letterSpacing: 0.5,
      ),
    ),

    dividerTheme: DividerThemeData(color: line),
  );

  static const TextStyle serifItalic = TextStyle(
    fontFamily: _serif,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.065 * 16,
    color: primary,
  );

  static const TextStyle navLinkStyle = TextStyle(
    fontFamily: _sans,
    fontSize: 12,
    color: navLink,
  );

  static const TextStyle buttonPrimaryStyle = TextStyle(
    fontFamily: _sans,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: onPrimary,
  );

  static const TextStyle brandStyle = TextStyle(
    fontFamily: _sans,
    fontSize: 11,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.43, // 0.13em
    color: onSurface,
  );
}
