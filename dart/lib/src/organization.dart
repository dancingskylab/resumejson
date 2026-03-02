import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/postal_address.dart';

/// A company, institution, or non-profit (§3.5).
///
/// Maps to Schema.org `Organization`.
class Organization {
  /// Creates an [Organization].
  ///
  /// [name] is required.
  const Organization({required this.name, this.url, this.location, this.cause});

  /// Deserializes an [Organization] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Organization.fromJson(Map<String, dynamic> json) {
    final locationMap = optionalMap(json, 'location');
    final addressMap = locationMap != null
        ? optionalMap(locationMap, 'address')
        : null;

    return Organization(
      name: requireString(json, 'name'),
      url: optionalString(json, 'url'),
      location: addressMap != null ? PostalAddress.fromJson(addressMap) : null,
      cause: optionalString(json, 'resumejson:cause'),
    );
  }

  /// Display name.
  final String name;

  /// Website URL.
  final String? url;

  /// Physical address.
  final PostalAddress? location;

  /// Social cause or mission (for volunteer organizations).
  final String? cause;

  /// Serializes this [Organization] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'Organization',
      'name': name,
      if (url != null) 'url': url,
      if (location != null) 'location': {'address': location!.toJson()},
      if (cause != null) 'resumejson:cause': cause,
    };
  }

  /// Returns a copy with the given fields replaced.
  Organization copyWith({
    String? name,
    String? url,
    PostalAddress? location,
    String? cause,
  }) {
    return Organization(
      name: name ?? this.name,
      url: url ?? this.url,
      location: location ?? this.location,
      cause: cause ?? this.cause,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Organization &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          url == other.url &&
          location == other.location &&
          cause == other.cause;

  @override
  int get hashCode => Object.hash(name, url, location, cause);

  @override
  String toString() => 'Organization(name: $name)';
}
