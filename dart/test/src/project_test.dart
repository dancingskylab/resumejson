import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Project', () {
    const full = Project(
      name: 'ResumeJSON',
      description: 'A resume specification.',
      url: 'https://github.com/resumejson',
      startDate: '2024-01-01',
      endDate: '2024-06-01',
      projectType: ProjectType.openSource,
      role: 'Creator',
      keywords: ['Dart', 'JSON-LD'],
    );
    const minimal = Project(name: 'Side project');

    test('construction with all fields.', () {
      expect(full.description, 'A resume specification.');
      expect(full.projectType, ProjectType.openSource);
      expect(full.keywords, hasLength(2));
    });

    test('construction with required fields only.', () {
      expect(minimal.description, isNull);
      expect(minimal.url, isNull);
      expect(minimal.projectType, isNull);
      expect(minimal.role, isNull);
      expect(minimal.keywords, isEmpty);
    });

    test('value equality.', () {
      const a = Project(name: 'X');
      const b = Project(name: 'X');
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
      final a = full.copyWith(keywords: ['Go']);
      expect(a, isNot(equals(full)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        projectType: ProjectType.personal,
        role: 'Owner',
      );
      expect(copy.name, 'Side project');
      expect(copy.projectType, ProjectType.personal);
      expect(copy.role, 'Owner');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and additionalType.', () {
      final json = full.toJson();
      expect(json['@type'], 'CreativeWork');
      expect(json['additionalType'], 'resumejson:Project');
      expect(json['resumejson:projectType'], 'open_source');
      expect(json['resumejson:role'], 'Creator');
      expect(json['keywords'], hasLength(2));
    });

    test('toJson omits null and empty fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('description'), isFalse);
      expect(json.containsKey('resumejson:projectType'), isFalse);
      expect(json.containsKey('keywords'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Project.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Project'));
      expect(full.toString(), contains('ResumeJSON'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        name: 'New',
        description: 'Desc',
        url: 'https://new.com',
        startDate: '2025-01',
        endDate: '2025-06',
        projectType: ProjectType.personal,
        role: 'Owner',
        keywords: ['Go'],
      );
      expect(copy.name, 'New');
      expect(copy.projectType, ProjectType.personal);
      expect(copy.keywords, ['Go']);
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = Project.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(keywords: ['Dart', 'Go', 'Rust']);
      expect(a, isNot(equals(full)));
    });
  });
}
