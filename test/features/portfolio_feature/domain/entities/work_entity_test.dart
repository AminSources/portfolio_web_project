import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

WorkEntity makeWork({
  String shortName = 'demo',
  String usedTechnologies = 'web - flutter',
  String year = '2026',
  String title = 'Demo project',
  String description = 'A test project.',
  String titleImagePath = 'lib/assets/images/demo.webp',
  String projectUrl = 'https://example.com/project',
}) {
  return WorkEntity(
    shortName: shortName,
    usedTechnologies: usedTechnologies,
    year: year,
    title: title,
    description: description,
    titleImagePath: titleImagePath,
    projectUrl: projectUrl,
  );
}

void main() {
  group('WorkEntity', () {
    test('stores every supplied field', () {
      final work = makeWork();

      expect(work.shortName, 'demo');
      expect(work.usedTechnologies, 'web - flutter');
      expect(work.year, '2026');
      expect(work.title, 'Demo project');
      expect(work.description, 'A test project.');
      expect(work.titleImagePath, 'lib/assets/images/demo.webp');
      expect(work.projectUrl, 'https://example.com/project');
    });

    test('compares entities by all declared properties', () {
      expect(makeWork(), equals(makeWork()));
      expect(makeWork(), isNot(same(makeWork())));
      expect(makeWork(), isNot(equals(makeWork(title: 'Different title'))));
      expect(makeWork(), isNot(equals(makeWork(projectUrl: 'https://example.org'))));
    });

    test('supports use in a set using value equality', () {
      final works = {makeWork(), makeWork(), makeWork(shortName: 'other')};

      expect(works.length, 2);
    });
  });
}
