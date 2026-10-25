import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

import '../../helpers/fakes.dart';

void main() {
  group('WorkEntity', () {
    test('stores all constructor fields', () {
      const work = kSampleWork;

      expect(work.shortName, 'hamsafar');
      expect(work.usedTechnologies, 'mobile - flutter');
      expect(work.year, '2026');
      expect(work.title, 'Hamsafar-Coordinate travel');
      expect(work.description, isNotEmpty);
      expect(work.titleImagePath, 'lib/assets/images/hamsafar.webp');
      expect(work.projectUrl, startsWith('https://'));
    });

    test('extends Equatable and compares by value', () {
      const a = WorkEntity(
        shortName: 'x',
        usedTechnologies: 'y',
        year: '2026',
        title: 't',
        description: 'd',
        titleImagePath: 'p',
        projectUrl: 'u',
      );
      const b = WorkEntity(
        shortName: 'x',
        usedTechnologies: 'y',
        year: '2026',
        title: 't',
        description: 'd',
        titleImagePath: 'p',
        projectUrl: 'u',
      );

      expect(a, equals(b));
      expect(a.props, equals(b.props));
    });

    test('entities with different fields are not equal', () {
      expect(kSampleWork, isNot(equals(kSampleWork2)));
    });

    test('props contains exactly the seven declared fields', () {
      expect(kSampleWork.props.length, 7);
      expect(
        kSampleWork.props,
        containsAll([
          kSampleWork.shortName,
          kSampleWork.usedTechnologies,
          kSampleWork.year,
          kSampleWork.title,
          kSampleWork.description,
          kSampleWork.titleImagePath,
          kSampleWork.projectUrl,
        ]),
      );
    });
  });
}
