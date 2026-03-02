import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('PostalAddress', () {
    const minimal = PostalAddress(addressLocality: 'Edmonton');
    const full = PostalAddress(
      addressLocality: 'San Francisco',
      streetAddress: '123 Main St',
      addressRegion: 'CA',
      postalCode: '94105',
      addressCountry: 'US',
    );

    test('construction with required fields only.', () {
      expect(minimal.addressLocality, 'Edmonton');
      expect(minimal.streetAddress, isNull);
      expect(minimal.addressRegion, isNull);
      expect(minimal.postalCode, isNull);
      expect(minimal.addressCountry, isNull);
    });

    test('construction with all fields.', () {
      expect(full.streetAddress, '123 Main St');
      expect(full.postalCode, '94105');
    });

    test('value equality for identical values.', () {
      const a = PostalAddress(addressLocality: 'A', addressRegion: 'B');
      const b = PostalAddress(addressLocality: 'A', addressRegion: 'B');
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      const a = PostalAddress(addressLocality: 'A');
      const b = PostalAddress(addressLocality: 'B');
      expect(a, isNot(equals(b)));
    });

    test('inequality with different type.', () {
      expect(minimal == Object(), isFalse);
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(addressRegion: 'AB', postalCode: 'T6G');
      expect(copy.addressLocality, 'Edmonton');
      expect(copy.addressRegion, 'AB');
      expect(copy.postalCode, 'T6G');
    });

    test('copyWith with no arguments returns equal instance.', () {
      final copy = full.copyWith();
      expect(copy, equals(full));
    });

    test('toJson includes @type and required fields.', () {
      final json = minimal.toJson();
      expect(json['@type'], 'PostalAddress');
      expect(json['addressLocality'], 'Edmonton');
      expect(json.containsKey('streetAddress'), isFalse);
    });

    test('toJson includes all optional fields when present.', () {
      final json = full.toJson();
      expect(json['streetAddress'], '123 Main St');
      expect(json['addressRegion'], 'CA');
      expect(json['postalCode'], '94105');
      expect(json['addressCountry'], 'US');
    });

    test('fromJson round-trip preserves all fields.', () {
      final parsed = PostalAddress.fromJson(full.toJson());
      expect(parsed, equals(full));
    });

    test('toString contains class name and key fields.', () {
      final s = minimal.toString();
      expect(s, contains('PostalAddress'));
      expect(s, contains('Edmonton'));
    });

    test('hashCode is consistent across equal instances.', () {
      const a = PostalAddress(addressLocality: 'X');
      const b = PostalAddress(addressLocality: 'X');
      expect(a.hashCode, equals(b.hashCode));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        addressLocality: 'LA',
        streetAddress: '456 Oak Ave',
        addressRegion: 'NY',
        postalCode: '10001',
        addressCountry: 'CA',
      );
      expect(copy.addressLocality, 'LA');
      expect(copy.streetAddress, '456 Oak Ave');
      expect(copy.addressCountry, 'CA');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = PostalAddress.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });
  });
}
