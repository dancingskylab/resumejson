import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// A professional certification or license (§3.9).
///
/// Maps to Schema.org `EducationalOccupationalCredential` with
/// `credentialCategory` fixed to `"certification"`.
class Certification {
  /// Creates a [Certification].
  ///
  /// [name] and [recognizedBy] are required.
  const Certification({
    required this.name,
    required this.recognizedBy,
    this.validFrom,
    this.validThrough,
    this.credentialId,
    this.verificationUrl,
  });

  /// Deserializes a [Certification] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Certification.fromJson(Map<String, dynamic> json) {
    return Certification(
      name: requireString(json, 'name'),
      recognizedBy: Organization.fromJson(requireMap(json, 'recognizedBy')),
      validFrom: optionalString(json, 'validFrom'),
      validThrough: optionalString(json, 'validThrough'),
      credentialId: optionalString(json, 'resumejson:credentialId'),
      verificationUrl: optionalString(json, 'resumejson:verificationUrl'),
    );
  }

  /// Full certification name.
  final String name;

  /// The issuing body.
  final Organization recognizedBy;

  /// Date the certification was earned.
  final String? validFrom;

  /// Expiration date.
  final String? validThrough;

  /// Credential ID or license number.
  final String? credentialId;

  /// URL for verification.
  final String? verificationUrl;

  /// Serializes this [Certification] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'EducationalOccupationalCredential',
      'credentialCategory': 'certification',
      'name': name,
      'recognizedBy': recognizedBy.toJson(),
      if (validFrom != null) 'validFrom': validFrom,
      if (validThrough != null) 'validThrough': validThrough,
      if (credentialId != null) 'resumejson:credentialId': credentialId,
      if (verificationUrl != null)
        'resumejson:verificationUrl': verificationUrl,
    };
  }

  /// Returns a copy with the given fields replaced.
  Certification copyWith({
    String? name,
    Organization? recognizedBy,
    String? validFrom,
    String? validThrough,
    String? credentialId,
    String? verificationUrl,
  }) {
    return Certification(
      name: name ?? this.name,
      recognizedBy: recognizedBy ?? this.recognizedBy,
      validFrom: validFrom ?? this.validFrom,
      validThrough: validThrough ?? this.validThrough,
      credentialId: credentialId ?? this.credentialId,
      verificationUrl: verificationUrl ?? this.verificationUrl,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Certification &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          recognizedBy == other.recognizedBy &&
          validFrom == other.validFrom &&
          validThrough == other.validThrough &&
          credentialId == other.credentialId &&
          verificationUrl == other.verificationUrl;

  @override
  int get hashCode => Object.hash(
    name,
    recognizedBy,
    validFrom,
    validThrough,
    credentialId,
    verificationUrl,
  );

  @override
  String toString() => 'Certification(name: $name)';
}
