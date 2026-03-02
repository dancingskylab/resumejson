import 'package:resumejson/src/award.dart';
import 'package:resumejson/src/certification.dart';
import 'package:resumejson/src/contact_point.dart';
import 'package:resumejson/src/education.dart';
import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/language_proficiency.dart';
import 'package:resumejson/src/person_identity.dart';
import 'package:resumejson/src/postal_address.dart';
import 'package:resumejson/src/project.dart';
import 'package:resumejson/src/publication.dart';
import 'package:resumejson/src/skill.dart';
import 'package:resumejson/src/social_profile.dart';
import 'package:resumejson/src/volunteering.dart';
import 'package:resumejson/src/work_experience.dart';

/// The root ResumeJSON document (§3).
///
/// Maps to Schema.org `CreativeWork` with `additionalType` set to
/// `resumejson:StructuredResume`. Composes all entity blocks into a single
/// document with a standard JSON-LD `@context`.
class StructuredResume {
  /// Creates a [StructuredResume].
  ///
  /// [about] (the person identity) is required.
  const StructuredResume({
    required this.about,
    this.address,
    this.contactPoints = const [],
    this.socialProfiles = const [],
    this.workExperience = const [],
    this.education = const [],
    this.skills = const [],
    this.certifications = const [],
    this.projects = const [],
    this.volunteering = const [],
    this.awards = const [],
    this.languages = const [],
    this.publications = const [],
  });

  /// Deserializes a [StructuredResume] from a JSON map.
  ///
  /// The map should be the top-level ResumeJSON object including `@context`,
  /// `@type`, and `additionalType`.
  ///
  /// Each optional list section is parsed as a pipeline: the list is
  /// validated as `List<Map<String, dynamic>>` first, then each element is
  /// deserialized through its own `fromJson`. Throws [FormatException] if
  /// the required `about` field is missing or any section element has an
  /// invalid type.
  factory StructuredResume.fromJson(Map<String, dynamic> json) {
    final addressMap = optionalMap(json, 'resumejson:address');
    return StructuredResume(
      about: PersonIdentity.fromJson(requireMap(json, 'about')),
      address: addressMap != null ? PostalAddress.fromJson(addressMap) : null,
      contactPoints: optionalMapList(
        json,
        'resumejson:contactPoints',
      ).map(ContactPoint.fromJson).toList(),
      socialProfiles: optionalMapList(
        json,
        'resumejson:socialProfiles',
      ).map(SocialProfile.fromJson).toList(),
      workExperience: optionalMapList(
        json,
        'resumejson:workExperience',
      ).map(WorkExperience.fromJson).toList(),
      education: optionalMapList(
        json,
        'resumejson:education',
      ).map(Education.fromJson).toList(),
      skills: optionalMapList(
        json,
        'resumejson:skills',
      ).map(Skill.fromJson).toList(),
      certifications: optionalMapList(
        json,
        'resumejson:certifications',
      ).map(Certification.fromJson).toList(),
      projects: optionalMapList(
        json,
        'resumejson:projects',
      ).map(Project.fromJson).toList(),
      volunteering: optionalMapList(
        json,
        'resumejson:volunteering',
      ).map(Volunteering.fromJson).toList(),
      awards: optionalMapList(
        json,
        'resumejson:awards',
      ).map(Award.fromJson).toList(),
      languages: optionalMapList(
        json,
        'resumejson:languages',
      ).map(LanguageProficiency.fromJson).toList(),
      publications: optionalMapList(
        json,
        'resumejson:publications',
      ).map(Publication.fromJson).toList(),
    );
  }

  /// The subject of the resume.
  final PersonIdentity about;

  /// Physical mailing address.
  final PostalAddress? address;

  /// Contact methods.
  final List<ContactPoint> contactPoints;

  /// Social media / professional profiles.
  final List<SocialProfile> socialProfiles;

  /// Work experience entries.
  final List<WorkExperience> workExperience;

  /// Education entries.
  final List<Education> education;

  /// Skill entries.
  final List<Skill> skills;

  /// Certification entries.
  final List<Certification> certifications;

  /// Project entries.
  final List<Project> projects;

  /// Volunteering entries.
  final List<Volunteering> volunteering;

  /// Award entries.
  final List<Award> awards;

  /// Language proficiency entries.
  final List<LanguageProficiency> languages;

  /// Publication entries.
  final List<Publication> publications;

  /// Serializes this [StructuredResume] to a JSON-LD map.
  ///
  /// Includes the `@context`, `@type`, and `additionalType` envelope.
  Map<String, dynamic> toJson() {
    return {
      '@context': {
        '@vocab': 'https://schema.org/',
        'resumejson': 'https://auth.careers/schema/',
      },
      '@type': 'CreativeWork',
      'additionalType': 'resumejson:StructuredResume',
      'about': about.toJson(),
      if (address != null) 'resumejson:address': address!.toJson(),
      if (contactPoints.isNotEmpty)
        'resumejson:contactPoints': contactPoints
            .map((e) => e.toJson())
            .toList(),
      if (socialProfiles.isNotEmpty)
        'resumejson:socialProfiles': socialProfiles
            .map((e) => e.toJson())
            .toList(),
      if (workExperience.isNotEmpty)
        'resumejson:workExperience': workExperience
            .map((e) => e.toJson())
            .toList(),
      if (education.isNotEmpty)
        'resumejson:education': education.map((e) => e.toJson()).toList(),
      if (skills.isNotEmpty)
        'resumejson:skills': skills.map((e) => e.toJson()).toList(),
      if (certifications.isNotEmpty)
        'resumejson:certifications': certifications
            .map((e) => e.toJson())
            .toList(),
      if (projects.isNotEmpty)
        'resumejson:projects': projects.map((e) => e.toJson()).toList(),
      if (volunteering.isNotEmpty)
        'resumejson:volunteering': volunteering.map((e) => e.toJson()).toList(),
      if (awards.isNotEmpty)
        'resumejson:awards': awards.map((e) => e.toJson()).toList(),
      if (languages.isNotEmpty)
        'resumejson:languages': languages.map((e) => e.toJson()).toList(),
      if (publications.isNotEmpty)
        'resumejson:publications': publications.map((e) => e.toJson()).toList(),
    };
  }

  /// Returns a copy with the given fields replaced.
  StructuredResume copyWith({
    PersonIdentity? about,
    PostalAddress? address,
    List<ContactPoint>? contactPoints,
    List<SocialProfile>? socialProfiles,
    List<WorkExperience>? workExperience,
    List<Education>? education,
    List<Skill>? skills,
    List<Certification>? certifications,
    List<Project>? projects,
    List<Volunteering>? volunteering,
    List<Award>? awards,
    List<LanguageProficiency>? languages,
    List<Publication>? publications,
  }) {
    return StructuredResume(
      about: about ?? this.about,
      address: address ?? this.address,
      contactPoints: contactPoints ?? this.contactPoints,
      socialProfiles: socialProfiles ?? this.socialProfiles,
      workExperience: workExperience ?? this.workExperience,
      education: education ?? this.education,
      skills: skills ?? this.skills,
      certifications: certifications ?? this.certifications,
      projects: projects ?? this.projects,
      volunteering: volunteering ?? this.volunteering,
      awards: awards ?? this.awards,
      languages: languages ?? this.languages,
      publications: publications ?? this.publications,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StructuredResume &&
          runtimeType == other.runtimeType &&
          about == other.about &&
          address == other.address &&
          _listEquals(contactPoints, other.contactPoints) &&
          _listEquals(socialProfiles, other.socialProfiles) &&
          _listEquals(workExperience, other.workExperience) &&
          _listEquals(education, other.education) &&
          _listEquals(skills, other.skills) &&
          _listEquals(certifications, other.certifications) &&
          _listEquals(projects, other.projects) &&
          _listEquals(volunteering, other.volunteering) &&
          _listEquals(awards, other.awards) &&
          _listEquals(languages, other.languages) &&
          _listEquals(publications, other.publications);

  @override
  int get hashCode => Object.hash(
    about,
    address,
    Object.hashAll(contactPoints),
    Object.hashAll(socialProfiles),
    Object.hashAll(workExperience),
    Object.hashAll(education),
    Object.hashAll(skills),
    Object.hashAll(certifications),
    Object.hashAll(projects),
    Object.hashAll(volunteering),
    Object.hashAll(awards),
    Object.hashAll(languages),
    Object.hashAll(publications),
  );

  @override
  String toString() => 'StructuredResume(about: ${about.name})';
}

/// Whether [a] and [b] contain the same elements in the same order.
bool _listEquals<T>(List<T> a, List<T> b) {
  if (identical(a, b)) return true;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
