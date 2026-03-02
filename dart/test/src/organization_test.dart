import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Organization', () {
    const minimal = Organization(name: 'Acme');
    const full = Organization(
      name: 'TechCo',
      url: 'https://techco.example.com',
      location: PostalAddress(addressLocality: 'SF', addressRegion: 'CA'),
      cause: 'Civic tech',
    );

    test('construction with required field only.', () {
      expect(minimal.name, 'Acme');
      expect(minimal.url, isNull);
      expect(minimal.location, isNull);
      expect(minimal.cause, isNull);
    });

    test('value equality.', () {
      const a = Organization(name: 'X');
      const b = Organization(name: 'X');
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(minimal, isNot(equals(full)));
    });

    test('inequality with different type.', () {
      expect(minimal == Object(), isFalse);
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(url: 'https://acme.co', cause: 'Testing');
      expect(copy.name, 'Acme');
      expect(copy.url, 'https://acme.co');
      expect(copy.cause, 'Testing');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type.', () {
      final json = minimal.toJson();
      expect(json['@type'], 'Organization');
      expect(json['name'], 'Acme');
      expect(json.containsKey('url'), isFalse);
      expect(json.containsKey('resumejson:cause'), isFalse);
    });

    test('toJson with location wraps PostalAddress in location.address.', () {
      final json = full.toJson();
      expect(json['location']['address']['@type'], 'PostalAddress');
      expect(json['resumejson:cause'], 'Civic tech');
    });

    test('fromJson round-trip preserves all fields.', () {
      final parsed = Organization.fromJson(full.toJson());
      expect(parsed, equals(full));
    });

    test('fromJson handles missing optional fields.', () {
      final parsed = Organization.fromJson({
        'name': 'X',
        '@type': 'Organization',
      });
      expect(parsed.name, 'X');
      expect(parsed.url, isNull);
      expect(parsed.location, isNull);
      expect(parsed.cause, isNull);
    });

    test('fromJson handles location without address.', () {
      final parsed = Organization.fromJson({
        'name': 'X',
        '@type': 'Organization',
        'location': <String, dynamic>{},
      });
      expect(parsed.location, isNull);
    });

    test('toString contains class name and org name.', () {
      expect(minimal.toString(), contains('Organization'));
      expect(minimal.toString(), contains('Acme'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        name: 'NewCo',
        url: 'https://new.co',
        location: const PostalAddress(addressLocality: 'LA'),
        cause: 'AI Safety',
      );
      expect(copy.name, 'NewCo');
      expect(copy.url, 'https://new.co');
      expect(copy.location?.addressLocality, 'LA');
      expect(copy.cause, 'AI Safety');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('inequality on location field.', () {
      final a = minimal.copyWith(
        location: const PostalAddress(addressLocality: 'NYC'),
      );
      expect(a, isNot(equals(minimal)));
    });
  });
}
