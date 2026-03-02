import 'package:resumejson/src/json_helpers.dart';

/// The subject of the resume (§3.1).
///
/// Maps to Schema.org `Person`.
class PersonIdentity {
  /// Creates a [PersonIdentity].
  ///
  /// [givenName], [familyName], and [name] are required.
  const PersonIdentity({
    required this.givenName,
    required this.familyName,
    required this.name,
    this.additionalName,
    this.honorificPrefix,
    this.honorificSuffix,
    this.jobTitle,
    this.description,
    this.image,
  });

  /// Deserializes a [PersonIdentity] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory PersonIdentity.fromJson(Map<String, dynamic> json) {
    return PersonIdentity(
      givenName: requireString(json, 'givenName'),
      familyName: requireString(json, 'familyName'),
      name: requireString(json, 'name'),
      additionalName: optionalString(json, 'additionalName'),
      honorificPrefix: optionalString(json, 'honorificPrefix'),
      honorificSuffix: optionalString(json, 'honorificSuffix'),
      jobTitle: optionalString(json, 'jobTitle'),
      description: optionalString(json, 'description'),
      image: optionalString(json, 'image'),
    );
  }

  /// First / given name.
  final String givenName;

  /// Last / family name.
  final String familyName;

  /// Full display name.
  final String name;

  /// Middle name or initial.
  final String? additionalName;

  /// Title prefix (e.g., Dr., Prof.).
  final String? honorificPrefix;

  /// Title suffix (e.g., PhD, Jr.).
  final String? honorificSuffix;

  /// Current or most recent job title.
  final String? jobTitle;

  /// Professional summary.
  final String? description;

  /// URL to a headshot or avatar.
  final String? image;

  /// Serializes this [PersonIdentity] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'Person',
      'givenName': givenName,
      'familyName': familyName,
      'name': name,
      if (additionalName != null) 'additionalName': additionalName,
      if (honorificPrefix != null) 'honorificPrefix': honorificPrefix,
      if (honorificSuffix != null) 'honorificSuffix': honorificSuffix,
      if (jobTitle != null) 'jobTitle': jobTitle,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
    };
  }

  /// Returns a copy with the given fields replaced.
  PersonIdentity copyWith({
    String? givenName,
    String? familyName,
    String? name,
    String? additionalName,
    String? honorificPrefix,
    String? honorificSuffix,
    String? jobTitle,
    String? description,
    String? image,
  }) {
    return PersonIdentity(
      givenName: givenName ?? this.givenName,
      familyName: familyName ?? this.familyName,
      name: name ?? this.name,
      additionalName: additionalName ?? this.additionalName,
      honorificPrefix: honorificPrefix ?? this.honorificPrefix,
      honorificSuffix: honorificSuffix ?? this.honorificSuffix,
      jobTitle: jobTitle ?? this.jobTitle,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonIdentity &&
          runtimeType == other.runtimeType &&
          givenName == other.givenName &&
          familyName == other.familyName &&
          name == other.name &&
          additionalName == other.additionalName &&
          honorificPrefix == other.honorificPrefix &&
          honorificSuffix == other.honorificSuffix &&
          jobTitle == other.jobTitle &&
          description == other.description &&
          image == other.image;

  @override
  int get hashCode => Object.hash(
    givenName,
    familyName,
    name,
    additionalName,
    honorificPrefix,
    honorificSuffix,
    jobTitle,
    description,
    image,
  );

  @override
  String toString() => 'PersonIdentity(name: $name, jobTitle: $jobTitle)';
}
