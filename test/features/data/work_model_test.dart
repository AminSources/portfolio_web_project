import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/models/work_model.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

void main() {
  /// A raw JSON map exactly like an entry of portfolio-data.json.
  Map<String, dynamic> sampleJson() => {
        'short_name': 'hamsafar',
        'used_technologies': 'mobile - flutter',
        'year': '2026',
        'title': 'Hamsafar-Coordinate travel',
        'description': 'A Flutter application to coordinate trips.',
        'title_image_path': 'lib/assets/images/hamsafar.webp',
        'project_url': 'https://github.com/aminsources/hamsafar',
      };

  group('WorkModel.fromJson', () {
    test('maps every snake_case json key to the right field', () {
      final model = WorkModel.fromJson(sampleJson());

      expect(model.shortName, 'hamsafar');
      expect(model.usedTechnologies, 'mobile - flutter');
      expect(model.year, '2026');
      expect(model.title, 'Hamsafar-Coordinate travel');
      expect(model.description, isNotEmpty);
      expect(model.titleImagePath, 'lib/assets/images/hamsafar.webp');
      expect(model.projectUrl, 'https://github.com/aminsources/hamsafar');
    });

    test('is a subtype of WorkEntity (usable as entity)', () {
      final model = WorkModel.fromJson(sampleJson());

      expect(model, isA<WorkEntity>());
    });

    test('round-trips: two models from identical json are equal', () {
      final a = WorkModel.fromJson(sampleJson());
      final b = WorkModel.fromJson(sampleJson());

      expect(a, equals(b));
    });

    test('models from different json are not equal', () {
      final a = WorkModel.fromJson(sampleJson());
      final b = WorkModel.fromJson({...sampleJson(), 'title': 'other'});

      expect(a, isNot(equals(b)));
    });

    test('throws when a required key is missing (null assigned to String)',
        () {
      final broken = sampleJson()..remove('title');

      expect(() => WorkModel.fromJson(broken), throwsA(isA<TypeError>()));
    });
  });
}
