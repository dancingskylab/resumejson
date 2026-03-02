import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Award', () {
    const full = Award(
      name: 'Employee of the Year',
      description: 'Outstanding contribution.',
      awardedBy: Organization(name: 'TechCo'),
      dateAwarded: '2023-12-01',
    );
    const minimal = Award(name: 'Best Paper');

    test('construction with all fields.', () {
      expect(full.description, 'Outstanding contribution.');
      expect(full.awardedBy?.name, 'TechCo');
      expect(full.dateAwarded, '2023-12-01');
    });

    test('construction with required fields only.', () {
      expect(minimal.description, isNull);
      expect(minimal.awardedBy, isNull);
      expect(minimal.dateAwarded, isNull);
    });

    test('value equality.', () {
      const a = Award(name: 'X');
      const b = Award(name: 'X');
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
      final copy = minimal.copyWith(dateAwarded: '2024-01-01');
      expect(copy.name, 'Best Paper');
      expect(copy.dateAwarded, '2024-01-01');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type.', () {
      final json = full.toJson();
      expect(json['@type'], 'resumejson:Award');
      expect(json['name'], 'Employee of the Year');
      expect(json['resumejson:awardedBy'], isA<Map>());
      expect(json['resumejson:dateAwarded'], '2023-12-01');
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('description'), isFalse);
      expect(json.containsKey('resumejson:awardedBy'), isFalse);
      expect(json.containsKey('resumejson:dateAwarded'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Award.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Award'));
      expect(full.toString(), contains('Employee of the Year'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        name: 'New',
        description: 'Desc',
        awardedBy: const Organization(name: 'Org'),
        dateAwarded: '2025-01-01',
      );
      expect(copy.name, 'New');
      expect(copy.description, 'Desc');
      expect(copy.awardedBy?.name, 'Org');
      expect(copy.dateAwarded, '2025-01-01');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = Award.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });
  });
}
