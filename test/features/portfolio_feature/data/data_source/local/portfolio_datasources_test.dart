import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PortfolioDatasources', () {
    test('loads and decodes the portfolio JSON asset', () async {
      final data = await PortfolioDatasources().getWorks();

      expect(data, isA<List<dynamic>>());
      expect(data, isNotEmpty);
      expect(data.first, isA<Map<String, dynamic>>());
      expect(data.first, contains('short_name'));
      expect(data.first, contains('used_technologies'));
      expect(data.first, contains('project_url'));
    });

    test('the configured asset is valid JSON with required project keys', () async {
      final raw = await rootBundle.loadString(
        'lib/assets/portfolio/portfolio-data.json',
      );
      final decoded = jsonDecode(raw) as List<dynamic>;
      const requiredKeys = {
        'short_name',
        'used_technologies',
        'year',
        'title',
        'description',
        'title_image_path',
        'project_url',
      };

      expect(decoded, isNotEmpty);
      for (final record in decoded) {
        expect(record, isA<Map<String, dynamic>>());
        expect((record as Map<String, dynamic>).keys, containsAll(requiredKeys));
        for (final key in requiredKeys) {
          expect(record[key], isA<String>(), reason: 'invalid $key in $record');
          expect((record[key] as String).trim(), isNotEmpty, reason: '$key in $record');
        }
      }
    });
  });
}
