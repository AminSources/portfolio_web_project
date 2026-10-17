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
      // ── تیترهای بزرگ نمایشی ─────────────────────────────
      // هدر بخش تماس: clamp(54px, 8.5vw, 112px)
      displayLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 96,
        fontWeight: FontWeight.w600,
        height: 1.08,
        letterSpacing: -0.07 * 96,
        color: onSurface,
      ),
      // تیتر اصلی هیرو: clamp(48px, 6.3vw, 91px)
      displayMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 50,
        fontWeight: FontWeight.w600,
        height: 1.04,
        letterSpacing: -0.075 * 50,
        color: onSurface,
      ),
      // تیتر h2 بخش‌های About و Works: clamp(40px, 5.3vw, 72px)
      displaySmall: TextStyle(
        fontFamily: _sans,
        fontSize: 46,
        fontWeight: FontWeight.w600,
        height: 1.08,
        letterSpacing: -0.07 * 46,
        color: onSurface,
      ),

      // ── کلمات گرافیکی روی کارت پروژه‌ها ────────────────
      // .art-word — clamp(30px, 6vw, 80px)
      headlineLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 56,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.09 * 56,
        color: Color(0xE6FFF2E0), // rgba(255,242,224,.9)
      ),
      // .art-word-small — clamp(28px, 4.8vw, 60px)
      headlineMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 44,
        fontWeight: FontWeight.w800,
        letterSpacing: -0.09 * 44,
        color: Color(0xE6FFF2E0),
      ),
      // پاراگراف معرفی .lead — 19px
      headlineSmall: TextStyle(
        fontFamily: _sans,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.65,
        letterSpacing: -0.03 * 19,
        color: onSurface,
      ),

      // ── عنوان‌های میانی ─────────────────────────────────
      // .project-info h3 — 16px
      titleLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.04 * 16,
        color: onSurface,
      ),
      // .principle h3 — 15px
      titleMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: onSurface,
      ),
      // .nav-link — 12px
      titleSmall: TextStyle(
        fontFamily: _sans,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFFBCB2A8),
      ),

      // ── متن بدنه ────────────────────────────────────────
      // .hero-copy — 13px
      bodyLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 13,
        fontWeight: FontWeight.w400,
        height: 1.9,
        color: heroCopy,
      ),
      // .about-body p و .contact-copy — 12px
      bodyMedium: TextStyle(
        fontFamily: _sans,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 2.0,
        color: muted,
      ),
      // پاراگراف‌های 11px (پروژه‌ها، اصول، معرفی‌ها)
      bodySmall: TextStyle(
        fontFamily: _sans,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        height: 1.8,
        color: muted,
      ),

      // ── برچسب‌ها ────────────────────────────────────────
      // دکمه‌ها و برند — 11px
      labelLarge: TextStyle(
        fontFamily: _sans,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: onSurface,
      ),
      // برچسب‌های مونو 9px با فاصله‌گذاری 0.13em
      labelMedium: TextStyle(
        fontFamily: _mono,
        fontSize: 11,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.13 * 9,
        color: primary,
      ),
      // ریزبرچسب‌های مونو 8px با فاصله‌گذاری 0.13em
      labelSmall: TextStyle(
        fontFamily: _mono,
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.13 * 8,
        color: dim,
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
