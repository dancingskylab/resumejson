import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Certification', () {
    const full = Certification(
      name: 'AWS Solutions Architect',
      recognizedBy: Organization(name: 'Amazon Web Services'),
      validFrom: '2023-01-15',
      validThrough: '2026-01-15',
      credentialId: 'ABC-123',
      verificationUrl: 'https://aws.amazon.com/verify/ABC-123',
    );
    const minimal = Certification(
      name: 'GCP Associate',
      recognizedBy: Organization(name: 'Google'),
    );

    test('construction with all fields.', () {
      expect(full.validFrom, '2023-01-15');
      expect(full.validThrough, '2026-01-15');
      expect(full.credentialId, 'ABC-123');
      expect(full.verificationUrl, contains('verify'));
    });

    test('construction with required fields only.', () {
      expect(minimal.validFrom, isNull);
      expect(minimal.validThrough, isNull);
      expect(minimal.credentialId, isNull);
      expect(minimal.verificationUrl, isNull);
    });

    test('value equality.', () {
      const a = Certification(
        name: 'X',
        recognizedBy: Organization(name: 'Y'),
      );
      const b = Certification(
        name: 'X',
        recognizedBy: Organization(name: 'Y'),
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

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(validFrom: '2024-01-01');
      expect(copy.name, 'GCP Associate');
      expect(copy.validFrom, '2024-01-01');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type and credentialCategory.', () {
      final json = full.toJson();
      expect(json['@type'], 'EducationalOccupationalCredential');
      expect(json['credentialCategory'], 'certification');
      expect(json['name'], 'AWS Solutions Architect');
      expect(json['resumejson:credentialId'], 'ABC-123');
      expect(json['resumejson:verificationUrl'], contains('verify'));
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('validFrom'), isFalse);
      expect(json.containsKey('resumejson:credentialId'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Certification.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Certification'));
      expect(full.toString(), contains('AWS Solutions Architect'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        name: 'New',
        recognizedBy: const Organization(name: 'Org'),
        validFrom: '2025-01-01',
        validThrough: '2028-01-01',
        credentialId: 'XYZ',
        verificationUrl: 'https://example.com',
      );
      expect(copy.name, 'New');
      expect(copy.recognizedBy.name, 'Org');
      expect(copy.credentialId, 'XYZ');
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('fromJson with minimal fields.', () {
      final parsed = Certification.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });
  });
}
