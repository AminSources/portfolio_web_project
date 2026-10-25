import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Wraps [child] with the widgets sections rely on:
/// - [ScreenUtilInit] (sections use `.w` / `.sp` sizing)
/// - A [MaterialApp]-less `MaterialApp` theme context (`Theme.of(context)`)
Widget wrapWithApp({
  required Widget child,
  Size canvasSize = const Size(1200, 2000),
  ThemeData? themeOverride,
}) {
  return ScreenUtilInit(
    designSize: const Size(1280, 800),
    builder: (context, _) {
      return MediaQuery(
        data: MediaQueryData(size: canvasSize),
        child: MaterialApp(
          theme: themeOverride,
          home: Scaffold(body: child),
        ),
      );
    },
  );
}
