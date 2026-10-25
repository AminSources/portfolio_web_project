import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/models/work_model.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

void main() {
  const json = <String, dynamic>{
    'short_name': 'hamsafar',
    'used_technologies': 'mobile - flutter',
    'year': '2026',
    'title': 'Hamsafar — Coordinate travel',
    'description': 'A travel coordination app.',
    'title_image_path': 'lib/assets/images/hamsafar.webp',
    'project_url': 'https://github.com/aminsources/hamsafar',
  };

  group('WorkModel.fromJson', () {
    test('maps JSON snake_case keys to the entity fields', () {
      final model = WorkModel.fromJson(json);

      expect(model, isA<WorkEntity>());
      expect(model.shortName, 'hamsafar');
      expect(model.usedTechnologies, 'mobile - flutter');
      expect(model.year, '2026');
      expect(model.title, 'Hamsafar — Coordinate travel');
      expect(model.description, 'A travel coordination app.');
      expect(model.titleImagePath, 'lib/assets/images/hamsafar.webp');
      expect(model.projectUrl, 'https://github.com/aminsources/hamsafar');
    });

    test('preserves values without trimming or rewriting them', () {
      final source = <String, dynamic>{
        ...json,
        'short_name': ' custom name ',
        'description': ' line one\nline two ',
      };

      final model = WorkModel.fromJson(source);
      expect(model.shortName, ' custom name ');
      expect(model.description, ' line one\nline two ');
    });

    test('rejects a record missing required string fields', () {
      expect(
        () => WorkModel.fromJson({'short_name': 'incomplete'}),
        throwsA(anything),
      );
    });

    test('rejects incompatible field types', () {
      expect(
        () => WorkModel.fromJson({...json, 'year': 2026}),
        throwsA(anything),
      );
    });
  });
}
