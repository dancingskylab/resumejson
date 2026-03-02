import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('SocialProfile', () {
    const full = SocialProfile(
      platform: SocialPlatform.github,
      url: 'https://github.com/janedoe',
      username: 'janedoe',
      displayText: 'Jane on GitHub',
    );
    const minimal = SocialProfile(
      platform: SocialPlatform.linkedin,
      url: 'https://linkedin.com/in/janedoe',
    );

    test('construction with all fields.', () {
      expect(full.platform, SocialPlatform.github);
      expect(full.username, 'janedoe');
      expect(full.displayText, 'Jane on GitHub');
    });

    test('construction with required fields only.', () {
      expect(minimal.username, isNull);
      expect(minimal.displayText, isNull);
    });

    test('value equality.', () {
      const a = SocialProfile(platform: SocialPlatform.github, url: 'u');
      const b = SocialProfile(platform: SocialPlatform.github, url: 'u');
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('inequality with different type.', () {
      expect(full == Object(), isFalse);
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(username: 'jd');
      expect(copy.url, minimal.url);
      expect(copy.username, 'jd');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes resumejson: prefixed keys.', () {
      final json = full.toJson();
      expect(json['@type'], 'resumejson:SocialProfile');
      expect(json['resumejson:platform'], 'github');
      expect(json['resumejson:username'], 'janedoe');
      expect(json['resumejson:displayText'], 'Jane on GitHub');
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('resumejson:username'), isFalse);
      expect(json.containsKey('resumejson:displayText'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(SocialProfile.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name and platform.', () {
      final s = full.toString();
      expect(s, contains('SocialProfile'));
      expect(s, contains('github'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        platform: SocialPlatform.linkedin,
        url: 'https://linkedin.com/in/jd',
        username: 'jd',
        displayText: 'Jane on LinkedIn',
      );
      expect(copy.platform, SocialPlatform.linkedin);
      expect(copy.url, 'https://linkedin.com/in/jd');
      expect(copy.username, 'jd');
      expect(copy.displayText, 'Jane on LinkedIn');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = SocialProfile.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });
  });
}
