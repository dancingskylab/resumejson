import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('WorkExperience', () {
    final full = WorkExperience(
      roleName: 'Senior Engineer',
      startDate: '2020-01-15',
      memberOf: const Organization(name: 'TechCo', url: 'https://techco.com'),
      endDate: '2023-06-30',
      description: 'Led platform team.',
      employmentType: EmploymentType.fullTime,
      workLocationType: WorkLocationType.remote,
      responsibilities: const ['Design APIs', 'Review code'],
      achievements: const ['Reduced latency 40%'],
      keywords: const ['Dart', 'Go'],
    );
    const minimal = WorkExperience(
      roleName: 'Intern',
      startDate: '2019-06-01',
      memberOf: Organization(name: 'StartupCo'),
    );

    test('construction with all fields.', () {
      expect(full.roleName, 'Senior Engineer');
      expect(full.employmentType, EmploymentType.fullTime);
      expect(full.responsibilities, hasLength(2));
    });

    test('construction with required fields only.', () {
      expect(minimal.endDate, isNull);
      expect(minimal.description, isNull);
      expect(minimal.responsibilities, isEmpty);
      expect(minimal.achievements, isEmpty);
      expect(minimal.keywords, isEmpty);
    });

    test('value equality.', () {
      final a = WorkExperience(
        roleName: 'X',
        startDate: '2020-01-01',
        memberOf: const Organization(name: 'Y'),
      );
      final b = WorkExperience(
        roleName: 'X',
        startDate: '2020-01-01',
        memberOf: const Organization(name: 'Y'),
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
      final a = full.copyWith(responsibilities: ['A']);
      expect(a, isNot(equals(full)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        endDate: '2019-09-01',
        employmentType: EmploymentType.internship,
      );
      expect(copy.roleName, 'Intern');
      expect(copy.endDate, '2019-09-01');
      expect(copy.employmentType, EmploymentType.internship);
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and schema fields.', () {
      final json = full.toJson();
      expect(json['@type'], 'OrganizationRole');
      expect(json['roleName'], 'Senior Engineer');
      expect(json['employmentType'], 'FULL_TIME');
      expect(json['resumejson:workLocationType'], 'remote');
      expect(json['resumejson:responsibilities'], hasLength(2));
      expect(json['resumejson:achievements'], hasLength(1));
      expect(json['keywords'], hasLength(2));
    });

    test('toJson omits empty lists and null fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('endDate'), isFalse);
      expect(json.containsKey('resumejson:responsibilities'), isFalse);
      expect(json.containsKey('keywords'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(WorkExperience.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('WorkExperience'));
      expect(full.toString(), contains('Senior Engineer'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        roleName: 'CTO',
        startDate: '2024-01',
        memberOf: const Organization(name: 'NewCo'),
        endDate: '2025-01',
        description: 'Led company.',
        employmentType: EmploymentType.contract,
        workLocationType: WorkLocationType.hybrid,
        department: 'Engineering',
        responsibilities: ['Strategy'],
        achievements: ['IPO'],
        keywords: ['Leadership'],
      );
      expect(copy.roleName, 'CTO');
      expect(copy.memberOf.name, 'NewCo');
      expect(copy.department, 'Engineering');
      expect(copy.keywords, ['Leadership']);
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = WorkExperience.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(keywords: ['Dart', 'Go', 'Rust']);
      expect(a, isNot(equals(full)));
    });
  });
}
