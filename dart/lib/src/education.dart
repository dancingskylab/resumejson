import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// A single educational credential (§3.7).
///
/// Maps to Schema.org `EducationalOccupationalCredential`.
class Education {
  /// Creates an [Education].
  ///
  /// [credentialCategory], [name], and [recognizedBy] are required.
  const Education({
    required this.credentialCategory,
    required this.name,
    required this.recognizedBy,
    this.about,
    this.minor,
    this.specialization,
    this.startDate,
    this.dateCreated,
    this.expectedGraduation,
    this.gpa,
    this.honors,
    this.relevantCoursework,
    this.thesis,
    this.activities,
  });

  /// Deserializes an [Education] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      credentialCategory: CredentialCategory.fromJson(
        requireString(json, 'credentialCategory'),
      ),
      name: requireString(json, 'name'),
      recognizedBy: Organization.fromJson(requireMap(json, 'recognizedBy')),
      about: optionalString(json, 'about'),
      minor: optionalString(json, 'resumejson:minor'),
      specialization: optionalString(json, 'resumejson:specialization'),
      startDate: optionalString(json, 'startDate'),
      dateCreated: optionalString(json, 'dateCreated'),
      expectedGraduation: optionalString(json, 'resumejson:expectedGraduation'),
      gpa: optionalString(json, 'resumejson:gpa'),
      honors: optionalString(json, 'resumejson:honors'),
      relevantCoursework: optionalStringList(
        json,
        'resumejson:relevantCoursework',
      ),
      thesis: optionalString(json, 'resumejson:thesis'),
      activities: optionalStringList(json, 'resumejson:activities'),
    );
  }

  /// Category of credential.
  final CredentialCategory credentialCategory;

  /// Full degree or credential name.
  final String name;

  /// Awarding institution.
  final Organization recognizedBy;

  /// Field of study or major.
  final String? about;

  /// Minor or secondary concentration.
  final String? minor;

  /// Specialization within the major.
  final String? specialization;

  /// Program start date.
  final String? startDate;

  /// Graduation or completion date.
  final String? dateCreated;

  /// Expected graduation date if not yet completed.
  final String? expectedGraduation;

  /// Grade point average as stated.
  final String? gpa;

  /// Academic honors (e.g., "Cum Laude").
  final String? honors;

  /// Relevant course names.
  final List<String>? relevantCoursework;

  /// Thesis or dissertation title.
  final String? thesis;

  /// Extracurricular activities.
  final List<String>? activities;

  /// Serializes this [Education] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'EducationalOccupationalCredential',
      'credentialCategory': credentialCategory.jsonValue,
      'name': name,
      'recognizedBy': recognizedBy.toJson(),
      if (about != null) 'about': about,
      if (minor != null) 'resumejson:minor': minor,
      if (specialization != null) 'resumejson:specialization': specialization,
      if (startDate != null) 'startDate': startDate,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (expectedGraduation != null)
        'resumejson:expectedGraduation': expectedGraduation,
      if (gpa != null) 'resumejson:gpa': gpa,
      if (honors != null) 'resumejson:honors': honors,
      if (relevantCoursework != null)
        'resumejson:relevantCoursework': relevantCoursework,
      if (thesis != null) 'resumejson:thesis': thesis,
      if (activities != null) 'resumejson:activities': activities,
    };
  }

  /// Returns a copy with the given fields replaced.
  Education copyWith({
    CredentialCategory? credentialCategory,
    String? name,
    Organization? recognizedBy,
    String? about,
    String? minor,
    String? specialization,
    String? startDate,
    String? dateCreated,
    String? expectedGraduation,
    String? gpa,
    String? honors,
    List<String>? relevantCoursework,
    String? thesis,
    List<String>? activities,
  }) {
    return Education(
      credentialCategory: credentialCategory ?? this.credentialCategory,
      name: name ?? this.name,
      recognizedBy: recognizedBy ?? this.recognizedBy,
      about: about ?? this.about,
      minor: minor ?? this.minor,
      specialization: specialization ?? this.specialization,
      startDate: startDate ?? this.startDate,
      dateCreated: dateCreated ?? this.dateCreated,
      expectedGraduation: expectedGraduation ?? this.expectedGraduation,
      gpa: gpa ?? this.gpa,
      honors: honors ?? this.honors,
      relevantCoursework: relevantCoursework ?? this.relevantCoursework,
      thesis: thesis ?? this.thesis,
      activities: activities ?? this.activities,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Education &&
          runtimeType == other.runtimeType &&
          credentialCategory == other.credentialCategory &&
          name == other.name &&
          recognizedBy == other.recognizedBy &&
          about == other.about &&
          minor == other.minor &&
          specialization == other.specialization &&
          startDate == other.startDate &&
          dateCreated == other.dateCreated &&
          expectedGraduation == other.expectedGraduation &&
          gpa == other.gpa &&
          honors == other.honors &&
          _listEquals(relevantCoursework, other.relevantCoursework) &&
          thesis == other.thesis &&
          _listEquals(activities, other.activities);

  @override
  int get hashCode => Object.hash(
    credentialCategory,
    name,
    recognizedBy,
    about,
    minor,
    specialization,
    startDate,
    dateCreated,
    expectedGraduation,
    gpa,
    honors,
    relevantCoursework != null ? Object.hashAll(relevantCoursework!) : null,
    thesis,
    activities != null ? Object.hashAll(activities!) : null,
  );

  @override
  String toString() =>
      'Education(name: $name, credentialCategory: ${credentialCategory.jsonValue})';
}

/// Whether [a] and [b] contain the same elements in the same order.
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
