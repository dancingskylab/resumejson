import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('LanguageProficiency', () {
    const full = LanguageProficiency(
      language: 'English',
      proficiency: LanguageProficiencyLevel.native,
      languageCode: 'en',
      isNative: true,
      certifications: ['IELTS 9.0'],
    );
    const minimal = LanguageProficiency(
      language: 'French',
      proficiency: LanguageProficiencyLevel.intermediate,
    );

    test('construction with all fields.', () {
      expect(full.languageCode, 'en');
      expect(full.isNative, isTrue);
      expect(full.certifications, hasLength(1));
    });

    test('construction with required fields only.', () {
      expect(minimal.languageCode, isNull);
      expect(minimal.isNative, isFalse);
      expect(minimal.certifications, isNull);
    });

    test('value equality.', () {
      const a = LanguageProficiency(
        language: 'X',
        proficiency: LanguageProficiencyLevel.basic,
      );
      const b = LanguageProficiency(
        language: 'X',
        proficiency: LanguageProficiencyLevel.basic,
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
      final a = full.copyWith(certifications: ['TOEFL 120']);
      expect(a, isNot(equals(full)));
    });

    test('inequality when one certifications list is null.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        languageCode: 'fr',
        certifications: ['DELF B2'],
      );
      expect(copy.language, 'French');
      expect(copy.languageCode, 'fr');
      expect(copy.certifications, ['DELF B2']);
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes resumejson: prefixed keys.', () {
      final json = full.toJson();
      expect(json['@type'], 'resumejson:LanguageProficiency');
      expect(json['resumejson:language'], 'English');
      expect(json['resumejson:proficiency'], 'native');
      expect(json['resumejson:languageCode'], 'en');
      expect(json['resumejson:isNative'], isTrue);
      expect(json['resumejson:certifications'], hasLength(1));
    });

    test('toJson omits isNative when false and null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('resumejson:languageCode'), isFalse);
      expect(json.containsKey('resumejson:isNative'), isFalse);
      expect(json.containsKey('resumejson:certifications'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(LanguageProficiency.fromJson(full.toJson()), equals(full));
    });

    test('fromJson handles missing optional fields.', () {
      expect(LanguageProficiency.fromJson(minimal.toJson()), equals(minimal));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('LanguageProficiency'));
      expect(full.toString(), contains('English'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        language: 'German',
        proficiency: LanguageProficiencyLevel.basic,
        languageCode: 'de',
        isNative: false,
        certifications: ['Goethe B1'],
      );
      expect(copy.language, 'German');
      expect(copy.isNative, isFalse);
      expect(copy.certifications, ['Goethe B1']);
    });

    test('hashCode on minimal instance with null lists.', () {
      expect(minimal.hashCode, isA<int>());
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(certifications: ['A', 'B']);
      expect(a, isNot(equals(full)));
    });
  });
}
