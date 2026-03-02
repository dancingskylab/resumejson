import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// An honor or recognition (§3.12).
///
/// Maps to `resumejson:Award`.
class Award {
  /// Creates an [Award].
  ///
  /// [name] is required.
  const Award({
    required this.name,
    this.description,
    this.awardedBy,
    this.dateAwarded,
  });

  /// Deserializes an [Award] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Award.fromJson(Map<String, dynamic> json) {
    final awardedByMap = optionalMap(json, 'resumejson:awardedBy');
    return Award(
      name: requireString(json, 'name'),
      description: optionalString(json, 'description'),
      awardedBy: awardedByMap != null
          ? Organization.fromJson(awardedByMap)
          : null,
      dateAwarded: optionalString(json, 'resumejson:dateAwarded'),
    );
  }

  /// Name of the award.
  final String name;

  /// Additional context.
  final String? description;

  /// The organization that granted the award.
  final Organization? awardedBy;

  /// When the award was received.
  final String? dateAwarded;

  /// Serializes this [Award] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'resumejson:Award',
      'name': name,
      if (description != null) 'description': description,
      if (awardedBy != null) 'resumejson:awardedBy': awardedBy!.toJson(),
      if (dateAwarded != null) 'resumejson:dateAwarded': dateAwarded,
    };
  }

  /// Returns a copy with the given fields replaced.
  Award copyWith({
    String? name,
    String? description,
    Organization? awardedBy,
    String? dateAwarded,
  }) {
    return Award(
      name: name ?? this.name,
      description: description ?? this.description,
      awardedBy: awardedBy ?? this.awardedBy,
      dateAwarded: dateAwarded ?? this.dateAwarded,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Award &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          description == other.description &&
          awardedBy == other.awardedBy &&
          dateAwarded == other.dateAwarded;

  @override
  int get hashCode => Object.hash(name, description, awardedBy, dateAwarded);

  @override
  String toString() => 'Award(name: $name)';
}
