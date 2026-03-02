import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';

/// A single skill entry (§3.8).
///
/// Maps to Schema.org `DefinedTerm`.
class Skill {
  /// Creates a [Skill].
  ///
  /// [name] and [category] are required.
  const Skill({
    required this.name,
    required this.category,
    this.proficiencyLevel,
    this.yearsOfExperience,
  });

  /// Deserializes a [Skill] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Skill.fromJson(Map<String, dynamic> json) {
    final profStr = optionalString(json, 'resumejson:proficiencyLevel');
    final yearsRaw = json['resumejson:yearsOfExperience'];
    double? years;
    if (yearsRaw is num) {
      years = yearsRaw.toDouble();
    } else if (yearsRaw != null) {
      throw FormatException(
        'Expected num for "resumejson:yearsOfExperience", '
        'got ${yearsRaw.runtimeType}.',
        json,
      );
    }
    return Skill(
      name: requireString(json, 'name'),
      category: SkillCategory.fromJson(requireString(json, 'termCode')),
      proficiencyLevel: profStr != null
          ? ProficiencyLevel.fromJson(profStr)
          : null,
      yearsOfExperience: years,
    );
  }

  /// The skill name.
  final String name;

  /// The skill category (serialized as `termCode`).
  final SkillCategory category;

  /// Proficiency level.
  final ProficiencyLevel? proficiencyLevel;

  /// Years of experience.
  final double? yearsOfExperience;

  /// Serializes this [Skill] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'DefinedTerm',
      'name': name,
      'termCode': category.jsonValue,
      if (proficiencyLevel != null)
        'resumejson:proficiencyLevel': proficiencyLevel!.jsonValue,
      if (yearsOfExperience != null)
        'resumejson:yearsOfExperience': yearsOfExperience,
    };
  }

  /// Returns a copy with the given fields replaced.
  Skill copyWith({
    String? name,
    SkillCategory? category,
    ProficiencyLevel? proficiencyLevel,
    double? yearsOfExperience,
  }) {
    return Skill(
      name: name ?? this.name,
      category: category ?? this.category,
      proficiencyLevel: proficiencyLevel ?? this.proficiencyLevel,
      yearsOfExperience: yearsOfExperience ?? this.yearsOfExperience,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Skill &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          category == other.category &&
          proficiencyLevel == other.proficiencyLevel &&
          yearsOfExperience == other.yearsOfExperience;

  @override
  int get hashCode =>
      Object.hash(name, category, proficiencyLevel, yearsOfExperience);

  @override
  String toString() => 'Skill(name: $name, category: ${category.jsonValue})';
}
