import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Volunteering', () {
    final full = Volunteering(
      roleName: 'Mentor',
      memberOf: const Organization(name: 'Code.org', cause: 'CS Education'),
      startDate: '2021-01-01',
      endDate: '2023-12-31',
      description: 'Mentored students.',
      responsibilities: const ['Teach workshops'],
      achievements: const ['Reached 100 students'],
    );
    const minimal = Volunteering(
      roleName: 'Volunteer',
      memberOf: Organization(name: 'Habitat'),
    );

    test('construction with all fields.', () {
      expect(full.roleName, 'Mentor');
      expect(full.memberOf.cause, 'CS Education');
      expect(full.responsibilities, hasLength(1));
    });

    test('construction with required fields only.', () {
      expect(minimal.startDate, isNull);
      expect(minimal.endDate, isNull);
      expect(minimal.description, isNull);
      expect(minimal.responsibilities, isEmpty);
      expect(minimal.achievements, isEmpty);
    });

    test('value equality.', () {
      const a = Volunteering(
        roleName: 'X',
        memberOf: Organization(name: 'Y'),
      );
      const b = Volunteering(
        roleName: 'X',
        memberOf: Organization(name: 'Y'),
      );
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('inequality with different type.', () {
      expect(full == Object(), isFalse);
    });

    test('inequality on list fields.', () {
      final a = full.copyWith(achievements: ['Different']);
      expect(a, isNot(equals(full)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(startDate: '2024-01-01');
      expect(copy.roleName, 'Volunteer');
      expect(copy.startDate, '2024-01-01');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and additionalType.', () {
      final json = full.toJson();
      expect(json['@type'], 'OrganizationRole');
      expect(json['additionalType'], 'VolunteerRole');
      expect(json['roleName'], 'Mentor');
      expect(json['resumejson:responsibilities'], hasLength(1));
      expect(json['resumejson:achievements'], hasLength(1));
    });

    test('toJson omits empty lists and null fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('startDate'), isFalse);
      expect(json.containsKey('resumejson:responsibilities'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Volunteering.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Volunteering'));
      expect(full.toString(), contains('Mentor'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        roleName: 'Lead',
        memberOf: const Organization(name: 'NewOrg'),
        startDate: '2025-01',
        endDate: '2025-12',
        description: 'Led team.',
        responsibilities: ['Plan events'],
        achievements: ['Won award'],
      );
      expect(copy.roleName, 'Lead');
      expect(copy.memberOf.name, 'NewOrg');
      expect(copy.responsibilities, ['Plan events']);
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = Volunteering.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(responsibilities: ['A', 'B', 'C']);
      expect(a, isNot(equals(full)));
    });
  });
}
