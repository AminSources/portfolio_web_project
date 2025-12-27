import 'package:flutter/material.dart';

class AppTheme {
  //? light theme config
  ThemeData lightTheme = ThemeData();

  //? dark theme config
  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6C63FF), // بنفش/آبی اصلی
      secondary: Color(0xFF00E5FF), // آبی فیروزه‌ای بک‌گراند اصلی (تیره‌تر)
      surface: Color(0xFF111A2E), // بک‌گراند ثانویه / کارت‌ها
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),

    scaffoldBackgroundColor: const Color(0xFF0B1220),

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF0B1220),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),

    // کارت‌ها / سکشن‌های تیره‌تر
    cardTheme: CardThemeData(
      color: const Color(0xFF111A2E),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // دکمه‌ها
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF6C63FF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      ),
    ),

    // متن‌ها
    textTheme: const TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      bodyMedium: TextStyle(fontSize: 14, height: 1.6),
      bodySmall: TextStyle(fontSize: 12, color: Colors.white70),
    ),

    // آیکن‌ها
    iconTheme: const IconThemeData(color: Colors.white70, size: 22),

    // Divider
    dividerTheme: const DividerThemeData(
      color: Color(0xFF1E2A47),
      thickness: 1,
    ),

    // Input ها
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF111A2E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
