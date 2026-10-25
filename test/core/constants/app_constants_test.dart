import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/constants/app_lists.dart';
import 'package:portfolio_web_project/core/constants/app_urls.dart';
import 'package:portfolio_web_project/core/keys/navigation_keys.dart';

void main() {
  group('AppLists', () {
    test('contains the expected toolkit without blank or duplicate entries', () {
      expect(AppLists.toolkitList, isNotEmpty);
      expect(AppLists.toolkitList, containsAll(['Flutter', 'Dart', 'Python']));
      expect(AppLists.toolkitList.every((item) => item.trim().isNotEmpty), isTrue);
      expect(AppLists.toolkitList.toSet().length, AppLists.toolkitList.length);
    });

    test('principle titles and subtitles stay aligned', () {
      expect(AppLists.principleTitles, isNotEmpty);
      expect(AppLists.principleTitles.length, AppLists.principleSubtitles.length);
      expect(AppLists.principleTitles.every((item) => item.trim().isNotEmpty), isTrue);
      expect(AppLists.principleSubtitles.every((item) => item.trim().isNotEmpty), isTrue);
    });
  });

  group('AppUrls', () {
    test('social links use HTTPS and contain a host', () {
      final urls = [
        AppUrls.githubUrl,
        AppUrls.instagramUrl,
        AppUrls.telegramUrl,
      ];

      for (final value in urls) {
        final uri = Uri.parse(value);
        expect(uri.scheme, 'https', reason: value);
        expect(uri.host, isNotEmpty, reason: value);
      }
    });

    test('email link is a valid mailto URI', () {
      final uri = Uri.parse(AppUrls.emailUrl);

      expect(uri.scheme, 'mailto');
      expect(uri.path, contains('@'));
    });
  });

  group('NavigationKeys', () {
    test('each page section has a distinct GlobalKey', () {
      final keys = [
        NavigationKeys.heroSectionKey,
        NavigationKeys.aboutSectionKey,
        NavigationKeys.workSectionKey,
        NavigationKeys.contactSectionKey,
      ];

      expect(keys.toSet().length, keys.length);
    });
  });
}
