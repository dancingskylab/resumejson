import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';

/// A personal, academic, or open-source project (§3.10).
///
/// Maps to Schema.org `CreativeWork` with `additionalType` set to
/// `resumejson:Project`.
class Project {
  /// Creates a [Project].
  ///
  /// [name] is required.
  const Project({
    required this.name,
    this.description,
    this.url,
    this.startDate,
    this.endDate,
    this.projectType,
    this.role,
    this.keywords = const [],
  });

  /// Deserializes a [Project] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Project.fromJson(Map<String, dynamic> json) {
    final ptStr = optionalString(json, 'resumejson:projectType');
    return Project(
      name: requireString(json, 'name'),
      description: optionalString(json, 'description'),
      url: optionalString(json, 'url'),
      startDate: optionalString(json, 'startDate'),
      endDate: optionalString(json, 'endDate'),
      projectType: ptStr != null ? ProjectType.fromJson(ptStr) : null,
      role: optionalString(json, 'resumejson:role'),
      keywords: optionalStringListOrEmpty(json, 'keywords'),
    );
  }

  /// Project name.
  final String name;

  /// Brief description.
  final String? description;

  /// URL to the project.
  final String? url;

  /// When the project started.
  final String? startDate;

  /// When the project completed (absent = ongoing).
  final String? endDate;

  /// Type of project.
  final ProjectType? projectType;

  /// The candidate's role in the project.
  final String? role;

  /// Technology and tool names.
  final List<String> keywords;

  /// Serializes this [Project] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'CreativeWork',
      'additionalType': 'resumejson:Project',
      'name': name,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (startDate != null) 'startDate': startDate,
      if (endDate != null) 'endDate': endDate,
      if (projectType != null) 'resumejson:projectType': projectType!.jsonValue,
      if (role != null) 'resumejson:role': role,
      if (keywords.isNotEmpty) 'keywords': keywords,
    };
  }

  /// Returns a copy with the given fields replaced.
  Project copyWith({
    String? name,
    String? description,
    String? url,
    String? startDate,
    String? endDate,
    ProjectType? projectType,
    String? role,
    List<String>? keywords,
  }) {
    return Project(
      name: name ?? this.name,
      description: description ?? this.description,
      url: url ?? this.url,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      projectType: projectType ?? this.projectType,
      role: role ?? this.role,
      keywords: keywords ?? this.keywords,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Project &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          url == other.url &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          projectType == other.projectType &&
          role == other.role &&
          _listEquals(keywords, other.keywords);

  @override
  int get hashCode => Object.hash(
    name,
    description,
    url,
    startDate,
    endDate,
    projectType,
    role,
    Object.hashAll(keywords),
  );

  @override
  String toString() => 'Project(name: $name)';
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
