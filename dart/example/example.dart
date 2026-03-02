// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:resumejson/resumejson.dart';

/// Demonstrates creating, serializing, and deserializing a structured resume.
void main() {
  // Build a resume with typed data classes.
  final resume = StructuredResume(
    about: const PersonIdentity(
      givenName: 'Jane',
      familyName: 'Doe',
      name: 'Jane Doe',
      jobTitle: 'Senior Software Engineer',
    ),
    contactPoints: const [
      ContactPoint(contactType: ContactType.email, email: 'jane@example.com'),
    ],
    workExperience: [
      const WorkExperience(
        roleName: 'Senior Software Engineer',
        startDate: '2020-01-15',
        memberOf: Organization(name: 'TechCo', url: 'https://techco.example'),
        employmentType: EmploymentType.fullTime,
        responsibilities: ['Designed and built APIs'],
      ),
    ],
    skills: const [
      Skill(
        name: 'Dart',
        category: SkillCategory.language,
        proficiencyLevel: ProficiencyLevel.expert,
        yearsOfExperience: 5,
      ),
    ],
  );

  // Serialize to JSON-LD.
  final json = resume.toJson();
  print(const JsonEncoder.withIndent('  ').convert(json));

  // Deserialize back — value equality holds.
  final parsed = StructuredResume.fromJson(json);
  assert(resume == parsed);
  print('\nRound-trip equality: ${resume == parsed}');
}
