import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Education', () {
    final full = Education(
      credentialCategory: CredentialCategory.bachelor,
      name: 'BSc Computer Science',
      recognizedBy: const Organization(name: 'MIT'),
      startDate: '2016-09-01',
      dateCreated: '2020-06-15',
      about: 'Computer Science',
      minor: 'Mathematics',
      specialization: 'Distributed Systems',
      expectedGraduation: '2020-06',
      gpa: '3.9',
      honors: 'Magna Cum Laude',
      relevantCoursework: const ['OS', 'Compilers'],
      thesis: 'Distributed Consensus',
      activities: const ['Robotics Club'],
    );
    const minimal = Education(
      credentialCategory: CredentialCategory.master,
      name: 'MSc AI',
      recognizedBy: Organization(name: 'Stanford'),
    );

    test('construction with all fields.', () {
      expect(full.about, 'Computer Science');
      expect(full.minor, 'Mathematics');
      expect(full.specialization, 'Distributed Systems');
      expect(full.gpa, '3.9');
      expect(full.honors, 'Magna Cum Laude');
      expect(full.thesis, 'Distributed Consensus');
      expect(full.expectedGraduation, '2020-06');
      expect(full.relevantCoursework, hasLength(2));
      expect(full.activities, hasLength(1));
    });

    test('construction with required fields only.', () {
      expect(minimal.startDate, isNull);
      expect(minimal.dateCreated, isNull);
      expect(minimal.about, isNull);
      expect(minimal.minor, isNull);
      expect(minimal.specialization, isNull);
      expect(minimal.gpa, isNull);
      expect(minimal.honors, isNull);
      expect(minimal.thesis, isNull);
      expect(minimal.expectedGraduation, isNull);
      expect(minimal.relevantCoursework, isNull);
      expect(minimal.activities, isNull);
    });

    test('value equality.', () {
      const a = Education(
        credentialCategory: CredentialCategory.master,
        name: 'MSc AI',
        recognizedBy: Organization(name: 'Stanford'),
      );
      expect(a, equals(minimal));
      expect(a.hashCode, equals(minimal.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('inequality with different type.', () {
      expect(full == Object(), isFalse);
    });

    test('inequality on list fields.', () {
      final a = full.copyWith(relevantCoursework: ['Networking']);
      expect(a, isNot(equals(full)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        startDate: '2020-09-01',
        gpa: '4.0',
        activities: ['Debate'],
      );
      expect(copy.name, 'MSc AI');
      expect(copy.startDate, '2020-09-01');
      expect(copy.gpa, '4.0');
      expect(copy.activities, ['Debate']);
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and credential fields.', () {
      final json = full.toJson();
      expect(json['@type'], 'EducationalOccupationalCredential');
      expect(json['credentialCategory'], 'bachelor');
      expect(json['name'], 'BSc Computer Science');
      expect(json['about'], 'Computer Science');
      expect(json['resumejson:minor'], 'Mathematics');
      expect(json['resumejson:specialization'], 'Distributed Systems');
      expect(json['resumejson:gpa'], '3.9');
      expect(json['resumejson:honors'], 'Magna Cum Laude');
      expect(json['resumejson:thesis'], 'Distributed Consensus');
      expect(json['resumejson:expectedGraduation'], '2020-06');
      expect(json['resumejson:relevantCoursework'], hasLength(2));
      expect(json['resumejson:activities'], hasLength(1));
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('startDate'), isFalse);
      expect(json.containsKey('resumejson:about'), isFalse);
      expect(json.containsKey('resumejson:relevantCoursework'), isFalse);
      expect(json.containsKey('resumejson:thesis'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Education.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Education'));
      expect(full.toString(), contains('BSc Computer Science'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        credentialCategory: CredentialCategory.master,
        name: 'MSc',
        recognizedBy: const Organization(name: 'Stanford'),
        about: 'AI',
        minor: 'Stats',
        specialization: 'ML',
        startDate: '2021-09',
        dateCreated: '2023-06',
        expectedGraduation: '2023-06',
        gpa: '4.0',
        honors: 'Summa',
        relevantCoursework: ['ML'],
        thesis: 'GANs',
        activities: ['AI Club'],
      );
      expect(copy.name, 'MSc');
      expect(copy.about, 'AI');
      expect(copy.activities, ['AI Club']);
    });

    test('hashCode on minimal instance with null lists.', () {
      // Exercises the null branch of hashCode for nullable lists
      expect(minimal.hashCode, isA<int>());
    });

    test('fromJson with minimal fields.', () {
      final parsed = Education.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test('inequality when relevantCoursework is null vs non-null.', () {
      // Exercises _listEquals(null, non-null) branch
      final withCourses = minimal.copyWith(relevantCoursework: ['OS']);
      expect(withCourses, isNot(equals(minimal)));
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(activities: ['A', 'B']);
      expect(a, isNot(equals(full)));
    });
  });
}
