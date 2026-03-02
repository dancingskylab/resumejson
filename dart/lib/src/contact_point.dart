import 'package:resumejson/src/json_helpers.dart';

import 'enums.dart';

/// A single contact method (§3.3).
///
/// Maps to Schema.org `ContactPoint`.
class ContactPoint {
  /// Creates a [ContactPoint].
  ///
  /// [contactType] is required. Depending on the type, one of [email],
  /// [telephone], [faxNumber], or [url] MUST be provided.
  const ContactPoint({
    required this.contactType,
    this.email,
    this.telephone,
    this.faxNumber,
    this.url,
    this.label,
  });

  /// Deserializes a [ContactPoint] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory ContactPoint.fromJson(Map<String, dynamic> json) {
    return ContactPoint(
      contactType: ContactType.fromJson(requireString(json, 'contactType')),
      email: optionalString(json, 'email'),
      telephone: optionalString(json, 'telephone'),
      faxNumber: optionalString(json, 'faxNumber'),
      url: optionalString(json, 'url'),
      label: optionalString(json, 'resumejson:label'),
    );
  }

  /// The type of contact method.
  final ContactType contactType;

  /// Email address (required when [contactType] is [ContactType.email]).
  final String? email;

  /// Phone number (required when [contactType] is [ContactType.phone]).
  final String? telephone;

  /// Fax number (required when [contactType] is [ContactType.fax]).
  final String? faxNumber;

  /// Website URL (required when [contactType] is [ContactType.website]).
  final String? url;

  /// Human-readable label (e.g., "Work Phone").
  final String? label;

  /// Serializes this [ContactPoint] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'ContactPoint',
      'contactType': contactType.jsonValue,
      if (email != null) 'email': email,
      if (telephone != null) 'telephone': telephone,
      if (faxNumber != null) 'faxNumber': faxNumber,
      if (url != null) 'url': url,
      if (label != null) 'resumejson:label': label,
    };
  }

  /// Returns a copy with the given fields replaced.
  ContactPoint copyWith({
    ContactType? contactType,
    String? email,
    String? telephone,
    String? faxNumber,
    String? url,
    String? label,
  }) {
    return ContactPoint(
      contactType: contactType ?? this.contactType,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      faxNumber: faxNumber ?? this.faxNumber,
      url: url ?? this.url,
      label: label ?? this.label,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactPoint &&
          runtimeType == other.runtimeType &&
          contactType == other.contactType &&
          email == other.email &&
          telephone == other.telephone &&
          faxNumber == other.faxNumber &&
          url == other.url &&
          label == other.label;

  @override
  int get hashCode =>
      Object.hash(contactType, email, telephone, faxNumber, url, label);

  @override
  String toString() => 'ContactPoint(contactType: ${contactType.jsonValue})';
}
