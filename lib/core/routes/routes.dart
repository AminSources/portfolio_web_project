import 'package:flutter/material.dart';
import 'package:personal_page/core/widgets/main_wrapper.dart';

class Routes {
  Map<String, WidgetBuilder> get routes => {
    '/': (context) => const MainWrapper(),
  };
}
