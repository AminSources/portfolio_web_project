import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class PortfolioDatasources {
  new();

  Future<dynamic> getWorks() async {
    final response = await rootBundle.loadString(
      "lib/assets/portfolio/portfolio-data.json",
    );
    final data = json.decode(response);

    return data;
  }
}
