import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('ContactType', () {
    test('all values round-trip through JSON.', () {
      for (final v in ContactType.values) {
        expect(ContactType.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => ContactType.fromJson('nope'), throwsFormatException);
    });
  });

  group('SocialPlatform', () {
    test('all values round-trip through JSON.', () {
      for (final v in SocialPlatform.values) {
        expect(SocialPlatform.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => SocialPlatform.fromJson('nope'), throwsFormatException);
    });
  });

  group('EmploymentType', () {
    test('all values round-trip through JSON.', () {
      for (final v in EmploymentType.values) {
        expect(EmploymentType.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => EmploymentType.fromJson('nope'), throwsFormatException);
    });
  });

  group('WorkLocationType', () {
    test('all values round-trip through JSON.', () {
      for (final v in WorkLocationType.values) {
        expect(WorkLocationType.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => WorkLocationType.fromJson('nope'), throwsFormatException);
    });
  });

  group('CredentialCategory', () {
    test('all values round-trip through JSON.', () {
      for (final v in CredentialCategory.values) {
        expect(CredentialCategory.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => CredentialCategory.fromJson('nope'), throwsFormatException);
    });
  });

  group('SkillCategory', () {
    test('all values round-trip through JSON.', () {
      for (final v in SkillCategory.values) {
        expect(SkillCategory.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => SkillCategory.fromJson('nope'), throwsFormatException);
    });
  });

  group('ProficiencyLevel', () {
    test('all values round-trip through JSON.', () {
      for (final v in ProficiencyLevel.values) {
        expect(ProficiencyLevel.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => ProficiencyLevel.fromJson('nope'), throwsFormatException);
    });
  });

  group('LanguageProficiencyLevel', () {
    test('all values round-trip through JSON.', () {
      for (final v in LanguageProficiencyLevel.values) {
        expect(LanguageProficiencyLevel.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(
        () => LanguageProficiencyLevel.fromJson('nope'),
        throwsFormatException,
      );
    });
  });

  group('ProjectType', () {
    test('all values round-trip through JSON.', () {
      for (final v in ProjectType.values) {
        expect(ProjectType.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => ProjectType.fromJson('nope'), throwsFormatException);
    });
  });

  group('PublicationType', () {
    test('all values round-trip through JSON.', () {
      for (final v in PublicationType.values) {
        expect(PublicationType.fromJson(v.jsonValue), v);
      }
    });

    test('fromJson throws on unknown value.', () {
      expect(() => PublicationType.fromJson('nope'), throwsFormatException);
    });
  });
}
