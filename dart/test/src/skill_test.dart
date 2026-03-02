import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Skill', () {
    const full = Skill(
      name: 'Dart',
      category: SkillCategory.language,
      proficiencyLevel: ProficiencyLevel.expert,
      yearsOfExperience: 5,
    );
    const minimal = Skill(name: 'Teamwork', category: SkillCategory.soft);

    test('construction with all fields.', () {
      expect(full.name, 'Dart');
      expect(full.category, SkillCategory.language);
      expect(full.proficiencyLevel, ProficiencyLevel.expert);
      expect(full.yearsOfExperience, 5);
    });

    test('construction with required fields only.', () {
      expect(minimal.proficiencyLevel, isNull);
      expect(minimal.yearsOfExperience, isNull);
    });

    test('value equality.', () {
      const a = Skill(name: 'X', category: SkillCategory.tool);
      const b = Skill(name: 'X', category: SkillCategory.tool);
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
      final copy = minimal.copyWith(
        proficiencyLevel: ProficiencyLevel.intermediate,
      );
      expect(copy.name, 'Teamwork');
      expect(copy.proficiencyLevel, ProficiencyLevel.intermediate);
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type DefinedTerm.', () {
      final json = full.toJson();
      expect(json['@type'], 'DefinedTerm');
      expect(json['name'], 'Dart');
      expect(json['termCode'], 'language');
      expect(json['resumejson:proficiencyLevel'], 'expert');
      expect(json['resumejson:yearsOfExperience'], 5);
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('resumejson:proficiencyLevel'), isFalse);
      expect(json.containsKey('resumejson:yearsOfExperience'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Skill.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Skill'));
      expect(full.toString(), contains('Dart'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        name: 'Go',
        category: SkillCategory.tool,
        proficiencyLevel: ProficiencyLevel.beginner,
        yearsOfExperience: 1,
      );
      expect(copy.name, 'Go');
      expect(copy.category, SkillCategory.tool);
      expect(copy.yearsOfExperience, 1);
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = Skill.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test(
      'fromJson throws FormatException for wrong yearsOfExperience type.',
      () {
        expect(
          () => Skill.fromJson({
            'name': 'X',
            'termCode': 'tool',
            'resumejson:yearsOfExperience': 'not a number',
          }),
          throwsFormatException,
        );
      },
    );
  });
}
