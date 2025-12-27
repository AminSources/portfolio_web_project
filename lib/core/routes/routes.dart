import 'package:flutter/material.dart';
import 'package:personal_page/futures/home_future/presentation/pages/home_page.dart';

class Routes {
  Map<String, WidgetBuilder> get routes => {'/': (context) => const HomePage()};
}
