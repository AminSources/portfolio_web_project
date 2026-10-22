import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/theme/app_colors.dart';
import 'package:portfolio_web_project/core/theme/app_fonts.dart';

class AppTypography {
  final double width;

  const AppTypography(this.width);

  bool get isMobile => width < AppBreakpoints.mobile;
  bool get isTablet =>
      width < AppBreakpoints.tablet && width >= AppBreakpoints.mobile;

  TextTheme get textTheme => TextTheme(
    // ── تیترهای بزرگ نمایشی ─────────────────────────────
    // هدر بخش تماس: clamp(54px, 8.5vw, 112px)
    displayLarge: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 96,
      fontWeight: FontWeight.w600,
      height: 1.08,
      letterSpacing: -0.07 * 96,
      color: AppColors.onSurface,
    ),
    // تیتر اصلی هیرو: clamp(48px, 6.3vw, 91px)
    displayMedium: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: isMobile
          ? 40.sp
          : isTablet
          ? 28.sp
          : 20.sp,
      fontWeight: FontWeight.w600,
      height: 1.04,
      letterSpacing: -0.075 * 50,
      color: AppColors.onSurface,
    ),
    // تیتر h2 بخش‌های About و Works: clamp(40px, 5.3vw, 72px)
    displaySmall: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: isMobile
          ? 34.sp
          : isTablet
          ? 22.sp
          : 16.sp,
      fontWeight: FontWeight.w600,
      height: 1.08,
      letterSpacing: -0.07 * 46,
      color: AppColors.onSurface,
    ),

    // ── کلمات گرافیکی روی کارت پروژه‌ها ────────────────

    // .art-word-small — clamp(28px, 4.8vw, 60px)
    headlineMedium: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 18,
      fontWeight: FontWeight.w800,
      letterSpacing: -0.09 * 18,
      color: Color(0xE6FFF2E0),
    ),
    // پاراگراف معرفی .lead — 19px
    headlineSmall: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.65,
      letterSpacing: -0.03 * 16,
      color: AppColors.onSurface,
    ),

    // ── عنوان‌های میانی ─────────────────────────────────
    // .project-info h3 — 16px
    titleLarge: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 16,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.04 * 16,
      color: AppColors.onSurface,
    ),
    // .principle h3 — 15px
    titleMedium: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.onSurface,
    ),
    // .nav-link — 12px
    titleSmall: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: Color(0xFFBCB2A8),
    ),

    // ── متن بدنه ────────────────────────────────────────
    // .hero-copy — 13px
    bodyLarge: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 13,
      fontWeight: FontWeight.w400,
      height: 1.9,
      color: AppColors.heroCopy,
    ),
    // .about-body p و .contact-copy — 12px
    bodyMedium: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 2.0,
      color: AppColors.muted,
    ),
    // پاراگراف‌های 11px (پروژه‌ها، اصول، معرفی‌ها)
    bodySmall: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.8,
      color: AppColors.muted,
    ),

    // ── برچسب‌ها ────────────────────────────────────────
    // دکمه‌ها و برند — 11px
    labelLarge: TextStyle(
      fontFamily: AppFonts.sans,
      fontSize: 12,
      fontWeight: FontWeight.w700,
      color: AppColors.onSurface,
    ),
    // برچسب‌های مونو 9px با فاصله‌گذاری 0.13em
    labelMedium: TextStyle(
      fontFamily: AppFonts.mono,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.13 * 9,
      color: AppColors.primary,
    ),
    // ریزبرچسب‌های مونو 8px با فاصله‌گذاری 0.13em
    labelSmall: TextStyle(
      fontFamily: AppFonts.mono,
      fontSize: 9,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.13 * 8,
      color: AppColors.dim,
    ),
  );

  static const TextStyle serifItalic = TextStyle(
    fontFamily: AppFonts.serif,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.065 * 16,
    color: AppColors.primary,
  );

  static const TextStyle navLinkStyle = TextStyle(
    fontFamily: AppFonts.sans,
    fontSize: 12,
    color: AppColors.navLink,
  );

  static const TextStyle buttonPrimaryStyle = TextStyle(
    fontFamily: AppFonts.sans,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppColors.onPrimary,
  );

  static const TextStyle brandStyle = TextStyle(
    fontFamily: AppFonts.sans,
    fontSize: 11,
    fontWeight: FontWeight.w900,
    letterSpacing: 1.43, // 0.13em
    color: AppColors.onSurface,
  );
}
