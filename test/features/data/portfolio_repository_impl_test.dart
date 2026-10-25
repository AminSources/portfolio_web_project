import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

import '../../helpers/fakes.dart';

void main() {
  /// The real portfolio-data.json bundled with the app, used as fixture.
  const realJson = '''
[
  {
    "short_name": "hamsafar",
    "used_technologies": "mobile - flutter",
    "year": "2026",
    "title": "Hamsafar-Coordinate travel",
    "description": "Hamsafar is a Flutter application.",
    "title_image_path": "lib/assets/images/hamsafar.webp",
    "project_url": "https://github.com/aminsources/hamsafar"
  },
  {
    "short_name": "portfolio web",
    "used_technologies": "web - flutter",
    "year": "2026",
    "title": "Aminsources-Portfolio web",
    "description": "Aminsources web is an responsive and clean ui portfolio web",
    "title_image_path": "lib/assets/images/portfolio.webp",
    "project_url": "https://github.com/aminsources/portfolio_web_project"
  }
]''';

  group('PortfolioRepositoryImpl', () {
    test('returns DataSuccess with parsed WorkEntity list', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          response: json.decode(realJson),
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataSuccess<List<WorkEntity>>>());
      expect(result.data, hasLength(2));
      expect(result.data!.first, isA<WorkModelTypeCheck>());
      expect(result.data!.first.title, 'Hamsafar-Coordinate travel');
      expect(result.data!.last.shortName, 'portfolio web');
    });

    test('returns DataFailure when data source throws', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          error: Exception('asset missing'),
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataFailure<List<WorkEntity>>>());
      expect(result.message, contains('Could not get works data'));
      expect(result.message, contains('asset missing'));
      expect(result.data, isNull);
    });

    test('returns DataFailure when payload has invalid shape', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          response: [
            {'not': 'a work entry'},
          ],
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataFailure<List<WorkEntity>>>());
      expect(result.message, isNotNull);
    });

    test('returns empty success list for empty payload', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(response: []),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataSuccess<List<WorkEntity>>>());
      expect(result.data, isEmpty);
    });
  });

  group('PortfolioDatasources (real asset)', () {
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      // Load the actual asset through the rootBundle mechanism.
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler('flutter/assets', (message) {
        final key = utf8.decode(message!.buffer.asUint8List());
        if (key == 'lib/assets/portfolio/portfolio-data.json') {
          return Future.value(ByteData.view(
            Uint8List.fromList(utf8.encode(realJson)).buffer,
          ));
        }
        return Future.value(null);
      });
    });

    tearDown(() {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler('flutter/assets', null);
    });

    test('loads and decodes the bundled portfolio-data.json', () async {
      final data = await PortfolioDatasources().getWorks();

      expect(data, isA<List>());
      expect(data, hasLength(2));
      expect(data.first['short_name'], 'hamsafar');
    });
  });
}

/// Alias to keep the expectation readable while checking model typing.
typedef WorkModelTypeCheck = WorkEntity;
