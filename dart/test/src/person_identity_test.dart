import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('PersonIdentity', () {
    const minimal = PersonIdentity(
      givenName: 'Jane',
      familyName: 'Doe',
      name: 'Jane Doe',
    );
    const full = PersonIdentity(
      givenName: 'Jane',
      familyName: 'Doe',
      name: 'Jane Doe',
      additionalName: 'A.',
      honorificPrefix: 'Dr.',
      honorificSuffix: 'PhD',
      jobTitle: 'CTO',
      description: 'Leader.',
      image: 'https://example.com/photo.jpg',
    );

    test('construction with required fields only.', () {
      expect(minimal.givenName, 'Jane');
      expect(minimal.additionalName, isNull);
      expect(minimal.honorificPrefix, isNull);
      expect(minimal.jobTitle, isNull);
    });

    test('value equality.', () {
      const a = PersonIdentity(givenName: 'A', familyName: 'B', name: 'A B');
      const b = PersonIdentity(givenName: 'A', familyName: 'B', name: 'A B');
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
      final copy = minimal.copyWith(jobTitle: 'CEO', image: 'url');
      expect(copy.givenName, 'Jane');
      expect(copy.jobTitle, 'CEO');
      expect(copy.image, 'url');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and all present fields.', () {
      final json = full.toJson();
      expect(json['@type'], 'Person');
      expect(json['givenName'], 'Jane');
      expect(json['additionalName'], 'A.');
      expect(json['honorificPrefix'], 'Dr.');
      expect(json['honorificSuffix'], 'PhD');
      expect(json['jobTitle'], 'CTO');
      expect(json['description'], 'Leader.');
      expect(json['image'], 'https://example.com/photo.jpg');
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('additionalName'), isFalse);
      expect(json.containsKey('jobTitle'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(PersonIdentity.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name and key fields.', () {
      final s = full.toString();
      expect(s, contains('PersonIdentity'));
      expect(s, contains('Jane Doe'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        givenName: 'John',
        familyName: 'Smith',
        name: 'John Smith',
        additionalName: 'B.',
        honorificPrefix: 'Mr.',
        honorificSuffix: 'Esq',
        jobTitle: 'CEO',
        description: 'Founder.',
        image: 'https://example.com/new.jpg',
      );
      expect(copy.givenName, 'John');
      expect(copy.name, 'John Smith');
      expect(copy.honorificSuffix, 'Esq');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });
  });
}
