import 'package:resumejson/src/json_helpers.dart';

/// A physical mailing address (§3.2).
///
/// Maps to Schema.org `PostalAddress`.
class PostalAddress {
  /// Creates a [PostalAddress].
  ///
  /// [addressLocality] is required.
  const PostalAddress({
    required this.addressLocality,
    this.streetAddress,
    this.addressRegion,
    this.postalCode,
    this.addressCountry,
  });

  /// Deserializes a [PostalAddress] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory PostalAddress.fromJson(Map<String, dynamic> json) {
    return PostalAddress(
      addressLocality: requireString(json, 'addressLocality'),
      streetAddress: optionalString(json, 'streetAddress'),
      addressRegion: optionalString(json, 'addressRegion'),
      postalCode: optionalString(json, 'postalCode'),
      addressCountry: optionalString(json, 'addressCountry'),
    );
  }

  /// City or locality name.
  final String addressLocality;

  /// Street-level address.
  final String? streetAddress;

  /// State, province, or region.
  final String? addressRegion;

  /// ZIP or postal code.
  final String? postalCode;

  /// Country name or ISO 3166-1 alpha-2 code.
  final String? addressCountry;

  /// Serializes this [PostalAddress] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'PostalAddress',
      'addressLocality': addressLocality,
      if (streetAddress != null) 'streetAddress': streetAddress,
      if (addressRegion != null) 'addressRegion': addressRegion,
      if (postalCode != null) 'postalCode': postalCode,
      if (addressCountry != null) 'addressCountry': addressCountry,
    };
  }

  /// Returns a copy with the given fields replaced.
  PostalAddress copyWith({
    String? addressLocality,
    String? streetAddress,
    String? addressRegion,
    String? postalCode,
    String? addressCountry,
  }) {
    return PostalAddress(
      addressLocality: addressLocality ?? this.addressLocality,
      streetAddress: streetAddress ?? this.streetAddress,
      addressRegion: addressRegion ?? this.addressRegion,
      postalCode: postalCode ?? this.postalCode,
      addressCountry: addressCountry ?? this.addressCountry,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostalAddress &&
          runtimeType == other.runtimeType &&
          addressLocality == other.addressLocality &&
          streetAddress == other.streetAddress &&
          addressRegion == other.addressRegion &&
          postalCode == other.postalCode &&
          addressCountry == other.addressCountry;

  @override
  int get hashCode => Object.hash(
    addressLocality,
    streetAddress,
    addressRegion,
    postalCode,
    addressCountry,
  );

  /// Returns a human-readable representation of this [PostalAddress].
  @override
  String toString() => 'PostalAddress(addressLocality: $addressLocality)';
}
