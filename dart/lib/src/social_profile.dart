import 'package:resumejson/src/json_helpers.dart';

import 'enums.dart';

/// A social media or professional profile link (§3.4).
///
/// Maps to `resumejson:SocialProfile`.
class SocialProfile {
  /// Creates a [SocialProfile].
  ///
  /// [platform] and [url] are required.
  const SocialProfile({
    required this.platform,
    required this.url,
    this.username,
    this.displayText,
  });

  /// Deserializes a [SocialProfile] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory SocialProfile.fromJson(Map<String, dynamic> json) {
    return SocialProfile(
      platform: SocialPlatform.fromJson(
        requireString(json, 'resumejson:platform'),
      ),
      url: requireString(json, 'url'),
      username: optionalString(json, 'resumejson:username'),
      displayText: optionalString(json, 'resumejson:displayText'),
    );
  }

  /// The social platform identifier.
  final SocialPlatform platform;

  /// The full URL to the profile.
  final String url;

  /// The username or handle.
  final String? username;

  /// Display text as it appeared on the source resume.
  final String? displayText;

  /// Serializes this [SocialProfile] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'resumejson:SocialProfile',
      'resumejson:platform': platform.jsonValue,
      'url': url,
      if (username != null) 'resumejson:username': username,
      if (displayText != null) 'resumejson:displayText': displayText,
    };
  }

  /// Returns a copy with the given fields replaced.
  SocialProfile copyWith({
    SocialPlatform? platform,
    String? url,
    String? username,
    String? displayText,
  }) {
    return SocialProfile(
      platform: platform ?? this.platform,
      url: url ?? this.url,
      username: username ?? this.username,
      displayText: displayText ?? this.displayText,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialProfile &&
          runtimeType == other.runtimeType &&
          platform == other.platform &&
          url == other.url &&
          username == other.username &&
          displayText == other.displayText;

  @override
  int get hashCode => Object.hash(platform, url, username, displayText);

  @override
  String toString() =>
      'SocialProfile(platform: ${platform.jsonValue}, url: $url)';
}
