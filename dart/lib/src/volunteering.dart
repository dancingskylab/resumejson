import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// A single volunteer role (§3.11).
///
/// Maps to Schema.org `OrganizationRole` with `additionalType` set to
/// `VolunteerRole`.
class Volunteering {
  /// Creates a [Volunteering].
  ///
  /// [roleName] and [memberOf] are required.
  const Volunteering({
    required this.roleName,
    required this.memberOf,
    this.startDate,
    this.endDate,
    this.description,
    this.responsibilities = const [],
    this.achievements = const [],
  });

  /// Deserializes a [Volunteering] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Volunteering.fromJson(Map<String, dynamic> json) {
    return Volunteering(
      roleName: requireString(json, 'roleName'),
      memberOf: Organization.fromJson(requireMap(json, 'memberOf')),
      startDate: optionalString(json, 'startDate'),
      endDate: optionalString(json, 'endDate'),
      description: optionalString(json, 'description'),
      responsibilities: optionalStringListOrEmpty(
        json,
        'resumejson:responsibilities',
      ),
      achievements: optionalStringListOrEmpty(json, 'resumejson:achievements'),
    );
  }

  /// Volunteer role title.
  final String roleName;

  /// The volunteer organization.
  final Organization memberOf;

  /// Start date.
  final String? startDate;

  /// End date.
  final String? endDate;

  /// Free-text description.
  final String? description;

  /// Responsibility bullet points.
  final List<String> responsibilities;

  /// Achievement bullet points.
  final List<String> achievements;

  /// Serializes this [Volunteering] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'OrganizationRole',
      'additionalType': 'VolunteerRole',
      'roleName': roleName,
      'memberOf': memberOf.toJson(),
      if (startDate != null) 'startDate': startDate,
      if (endDate != null) 'endDate': endDate,
      if (description != null) 'description': description,
      if (responsibilities.isNotEmpty)
        'resumejson:responsibilities': responsibilities,
      if (achievements.isNotEmpty) 'resumejson:achievements': achievements,
    };
  }

  /// Returns a copy with the given fields replaced.
  Volunteering copyWith({
    String? roleName,
    Organization? memberOf,
    String? startDate,
    String? endDate,
    String? description,
    List<String>? responsibilities,
    List<String>? achievements,
  }) {
    return Volunteering(
      roleName: roleName ?? this.roleName,
      memberOf: memberOf ?? this.memberOf,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      responsibilities: responsibilities ?? this.responsibilities,
      achievements: achievements ?? this.achievements,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Volunteering &&
          runtimeType == other.runtimeType &&
          roleName == other.roleName &&
          memberOf == other.memberOf &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          description == other.description &&
          _listEquals(responsibilities, other.responsibilities) &&
          _listEquals(achievements, other.achievements);

  @override
  int get hashCode => Object.hash(
    roleName,
    memberOf,
    startDate,
    endDate,
    description,
    Object.hashAll(responsibilities),
    Object.hashAll(achievements),
  );

  @override
  String toString() =>
      'Volunteering(roleName: $roleName, memberOf: ${memberOf.name})';
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
