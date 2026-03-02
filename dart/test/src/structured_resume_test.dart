import 'dart:convert';
import 'dart:io';

import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('StructuredResume', () {
    const identity = PersonIdentity(
      givenName: 'Jane',
      familyName: 'Doe',
      name: 'Jane Doe',
      jobTitle: 'Engineer',
    );

    final full = StructuredResume(
      about: identity,
      address: const PostalAddress(addressLocality: 'SF', addressRegion: 'CA'),
      contactPoints: const [
        ContactPoint(contactType: ContactType.email, email: 'jane@example.com'),
      ],
      socialProfiles: const [
        SocialProfile(
          platform: SocialPlatform.github,
          url: 'https://github.com/janedoe',
        ),
      ],
      workExperience: [
        const WorkExperience(
          roleName: 'Engineer',
          startDate: '2020-01-01',
          memberOf: Organization(name: 'TechCo'),
        ),
      ],
      education: const [
        Education(
          credentialCategory: CredentialCategory.bachelor,
          name: 'BSc CS',
          recognizedBy: Organization(name: 'MIT'),
        ),
      ],
      skills: const [Skill(name: 'Dart', category: SkillCategory.language)],
      certifications: const [
        Certification(
          name: 'AWS SA',
          recognizedBy: Organization(name: 'AWS'),
        ),
      ],
      projects: const [Project(name: 'ResumeJSON')],
      volunteering: const [
        Volunteering(
          roleName: 'Mentor',
          memberOf: Organization(name: 'Code.org'),
        ),
      ],
      awards: const [Award(name: 'Best Paper')],
      languages: const [
        LanguageProficiency(
          language: 'English',
          proficiency: LanguageProficiencyLevel.native,
        ),
      ],
      publications: const [Publication(headline: 'My Paper')],
    );

    const minimal = StructuredResume(about: identity);

    test('construction with all sections.', () {
      expect(full.contactPoints, hasLength(1));
      expect(full.workExperience, hasLength(1));
      expect(full.education, hasLength(1));
      expect(full.skills, hasLength(1));
      expect(full.certifications, hasLength(1));
      expect(full.projects, hasLength(1));
      expect(full.volunteering, hasLength(1));
      expect(full.awards, hasLength(1));
      expect(full.languages, hasLength(1));
      expect(full.publications, hasLength(1));
    });

    test('construction with only required fields.', () {
      expect(minimal.address, isNull);
      expect(minimal.contactPoints, isEmpty);
      expect(minimal.workExperience, isEmpty);
    });

    test('value equality.', () {
      const a = StructuredResume(about: identity);
      const b = StructuredResume(about: identity);
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('inequality with different type.', () {
      expect(full == Object(), isFalse);
    });

    test('inequality on list sections.', () {
      final a = minimal.copyWith(
        skills: const [Skill(name: 'Go', category: SkillCategory.language)],
      );
      expect(a, isNot(equals(minimal)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        address: const PostalAddress(addressLocality: 'NYC'),
      );
      expect(copy.about, equals(identity));
      expect(copy.address?.addressLocality, 'NYC');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes JSON-LD envelope.', () {
      final json = full.toJson();
      expect(json['@context'], isA<Map>());
      expect(json['@type'], 'CreativeWork');
      expect(json['additionalType'], 'resumejson:StructuredResume');
      expect(json['about'], isA<Map>());
      expect(json['resumejson:address'], isA<Map>());
      expect(json['resumejson:contactPoints'], hasLength(1));
      expect(json['resumejson:workExperience'], hasLength(1));
    });

    test('toJson omits empty sections.', () {
      final json = minimal.toJson();
      expect(json.containsKey('resumejson:address'), isFalse);
      expect(json.containsKey('resumejson:contactPoints'), isFalse);
      expect(json.containsKey('resumejson:workExperience'), isFalse);
      expect(json.containsKey('resumejson:skills'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(StructuredResume.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('StructuredResume'));
      expect(full.toString(), contains('Jane Doe'));
    });

    test('copyWith replaces all sections at once.', () {
      final copy = full.copyWith(
        about: const PersonIdentity(
          givenName: 'John',
          familyName: 'Smith',
          name: 'John Smith',
        ),
        address: const PostalAddress(addressLocality: 'LA'),
        contactPoints: const [],
        socialProfiles: const [],
        workExperience: const [],
        education: const [],
        skills: const [],
        certifications: const [],
        projects: const [],
        volunteering: const [],
        awards: const [],
        languages: const [],
        publications: const [],
      );
      expect(copy.about.name, 'John Smith');
      expect(copy.address?.addressLocality, 'LA');
      expect(copy.contactPoints, isEmpty);
      expect(copy.workExperience, isEmpty);
    });

    test('hashCode differs for different instances.', () {
      expect(full.hashCode, isNot(equals(minimal.hashCode)));
    });

    test('inequality when multiple list sections differ.', () {
      final a = minimal.copyWith(
        education: const [
          Education(
            credentialCategory: CredentialCategory.doctorate,
            name: 'PhD',
            recognizedBy: Organization(name: 'CMU'),
          ),
        ],
        awards: const [Award(name: 'Nobel')],
      );
      expect(a, isNot(equals(minimal)));
    });

    test('inequality on socialProfiles.', () {
      final a = minimal.copyWith(
        socialProfiles: const [
          SocialProfile(
            platform: SocialPlatform.twitter,
            url: 'https://twitter.com/x',
          ),
        ],
      );
      expect(a, isNot(equals(minimal)));
    });
  });

  group('Example file parsing', () {
    test('complete.resume.json round-trips.', () {
      final file = File(
        '${Directory.current.parent.path}/examples/complete.resume.json',
      );
      final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final resume = StructuredResume.fromJson(json);

      expect(resume.about.name, 'Jane Doe');
      expect(resume.workExperience, hasLength(2));
      expect(resume.education, hasLength(2));
      expect(resume.skills, hasLength(3));
      expect(resume.certifications, hasLength(1));
      expect(resume.projects, hasLength(1));
      expect(resume.volunteering, hasLength(1));
      expect(resume.awards, hasLength(1));
      expect(resume.languages, hasLength(2));
      expect(resume.publications, hasLength(1));
      expect(resume.contactPoints, hasLength(2));

      // Round-trip preserves identity.
      final roundTripped = StructuredResume.fromJson(resume.toJson());
      expect(roundTripped, equals(resume));
    });

    test('minimal.resume.json round-trips.', () {
      final file = File(
        '${Directory.current.parent.path}/examples/minimal.resume.json',
      );
      final json = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
      final resume = StructuredResume.fromJson(json);

      expect(resume.about.name, 'Jane Doe');
      expect(resume.workExperience, hasLength(1));
      expect(resume.contactPoints, hasLength(1));

      final roundTripped = StructuredResume.fromJson(resume.toJson());
      expect(roundTripped, equals(resume));
    });
  });
}
