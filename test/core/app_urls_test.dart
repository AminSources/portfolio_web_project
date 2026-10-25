import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/constants/app_urls.dart';

void main() {
  group('AppUrls', () {
    test('github url points to the aminsources profile', () {
      expect(AppUrls.githubUrl, 'https://github.com/aminsources');
    });

    test('instagram url is a valid https url', () {
      expect(AppUrls.instagramUrl, startsWith('https://instagram.com/'));
    });

    test('telegram url is a valid https url', () {
      expect(AppUrls.telegramUrl, startsWith('https://t.me/'));
    });

    test('email url uses the mailto scheme', () {
      expect(AppUrls.emailUrl, startsWith('mailto:'));
    });

    test('all urls are parseable by Uri', () {
      for (final url in [
        AppUrls.githubUrl,
        AppUrls.instagramUrl,
        AppUrls.telegramUrl,
        AppUrls.emailUrl,
      ]) {
        final uri = Uri.tryParse(url);
        expect(uri, isNotNull, reason: '$url should be parseable');
        expect(uri!.hasScheme, isTrue, reason: '$url should have a scheme');
      }
    });
  });
}
