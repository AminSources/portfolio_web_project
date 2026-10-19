import 'package:flutter/material.dart';
import 'package:portfolio_web_project/locator.dart';

import 'app.dart';

void main() {
  //? init locator (Dependency injection)
  setup();

  //? run the app
  runApp(const App());
}
