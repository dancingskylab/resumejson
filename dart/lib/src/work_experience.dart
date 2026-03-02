import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// A single position held at an organization (§3.6).
///
/// Maps to Schema.org `OrganizationRole`.
class WorkExperience {
  /// Creates a [WorkExperience].
  ///
  /// [roleName], [startDate], and [memberOf] are required.
  const WorkExperience({
    required this.roleName,
    required this.startDate,
    required this.memberOf,
    this.endDate,
    this.description,
    this.employmentType,
    this.workLocationType,
    this.department,
    this.responsibilities = const [],
    this.achievements = const [],
    this.keywords = const [],
  });

  /// Deserializes a [WorkExperience] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory WorkExperience.fromJson(Map<String, dynamic> json) {
    final empStr = optionalString(json, 'employmentType');
    final wltStr = optionalString(json, 'resumejson:workLocationType');
    return WorkExperience(
      roleName: requireString(json, 'roleName'),
      startDate: requireString(json, 'startDate'),
      memberOf: Organization.fromJson(requireMap(json, 'memberOf')),
      endDate: optionalString(json, 'endDate'),
      description: optionalString(json, 'description'),
      employmentType: empStr != null ? EmploymentType.fromJson(empStr) : null,
      workLocationType: wltStr != null
          ? WorkLocationType.fromJson(wltStr)
          : null,
      department: optionalString(json, 'resumejson:department'),
      responsibilities: optionalStringListOrEmpty(
        json,
        'resumejson:responsibilities',
      ),
      achievements: optionalStringListOrEmpty(json, 'resumejson:achievements'),
      keywords: optionalStringListOrEmpty(json, 'keywords'),
    );
  }

  /// Job title.
  final String roleName;

  /// Start date in ISO 8601 partial format.
  final String startDate;

  /// The employer organization.
  final Organization memberOf;

  /// End date. Absent or null means current position.
  final String? endDate;

  /// Free-text summary of the role.
  final String? description;

  /// Type of employment.
  final EmploymentType? employmentType;

  /// Work location arrangement.
  final WorkLocationType? workLocationType;

  /// Department or team name.
  final String? department;

  /// Responsibility bullet points.
  final List<String> responsibilities;

  /// Achievement bullet points.
  final List<String> achievements;

  /// Technology, tool, or methodology names.
  final List<String> keywords;

  /// Serializes this [WorkExperience] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'OrganizationRole',
      'roleName': roleName,
      'startDate': startDate,
      if (endDate != null) 'endDate': endDate,
      'memberOf': memberOf.toJson(),
      if (description != null) 'description': description,
      if (employmentType != null) 'employmentType': employmentType!.jsonValue,
      if (workLocationType != null)
        'resumejson:workLocationType': workLocationType!.jsonValue,
      if (department != null) 'resumejson:department': department,
      if (responsibilities.isNotEmpty)
        'resumejson:responsibilities': responsibilities,
      if (achievements.isNotEmpty) 'resumejson:achievements': achievements,
      if (keywords.isNotEmpty) 'keywords': keywords,
    };
  }

  /// Returns a copy with the given fields replaced.
  WorkExperience copyWith({
    String? roleName,
    String? startDate,
    Organization? memberOf,
    String? endDate,
    String? description,
    EmploymentType? employmentType,
    WorkLocationType? workLocationType,
    String? department,
    List<String>? responsibilities,
    List<String>? achievements,
    List<String>? keywords,
  }) {
    return WorkExperience(
      roleName: roleName ?? this.roleName,
      startDate: startDate ?? this.startDate,
      memberOf: memberOf ?? this.memberOf,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      employmentType: employmentType ?? this.employmentType,
      workLocationType: workLocationType ?? this.workLocationType,
      department: department ?? this.department,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
      keywords: keywords ?? this.keywords,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkExperience &&
          runtimeType == other.runtimeType &&
          roleName == other.roleName &&
          startDate == other.startDate &&
          memberOf == other.memberOf &&
          endDate == other.endDate &&
          description == other.description &&
          employmentType == other.employmentType &&
          workLocationType == other.workLocationType &&
          department == other.department &&
          _listEquals(responsibilities, other.responsibilities) &&
          _listEquals(achievements, other.achievements) &&
          _listEquals(keywords, other.keywords);

  @override
  int get hashCode => Object.hash(
    roleName,
    startDate,
    memberOf,
    endDate,
    description,
    employmentType,
    workLocationType,
    department,
    Object.hashAll(responsibilities),
    Object.hashAll(achievements),
    Object.hashAll(keywords),
  );

  @override
  String toString() =>
      'WorkExperience(roleName: $roleName, memberOf: ${memberOf.name})';
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
