import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';

/// Fluency in a spoken or written language (§3.13).
///
/// Maps to `resumejson:LanguageProficiency`.
class LanguageProficiency {
  /// Creates a [LanguageProficiency].
  ///
  /// [language] and [proficiency] are required.
  const LanguageProficiency({
    required this.language,
    required this.proficiency,
    this.languageCode,
    this.isNative = false,
    this.certifications,
  });

  /// Deserializes a [LanguageProficiency] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory LanguageProficiency.fromJson(Map<String, dynamic> json) {
    return LanguageProficiency(
      language: requireString(json, 'resumejson:language'),
      proficiency: LanguageProficiencyLevel.fromJson(
        requireString(json, 'resumejson:proficiency'),
      ),
      languageCode: optionalString(json, 'resumejson:languageCode'),
      isNative: optionalBool(json, 'resumejson:isNative'),
      certifications: optionalStringList(json, 'resumejson:certifications'),
    );
  }

  /// The language name.
  final String language;

  /// Proficiency level.
  final LanguageProficiencyLevel proficiency;

  /// ISO 639-1 two-letter code.
  final String? languageCode;

  /// Whether this is the native language.
  final bool isNative;

  /// Language certification names.
  final List<String>? certifications;

  /// Serializes this [LanguageProficiency] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'resumejson:LanguageProficiency',
      'resumejson:language': language,
      'resumejson:proficiency': proficiency.jsonValue,
      if (languageCode != null) 'resumejson:languageCode': languageCode,
      if (isNative) 'resumejson:isNative': isNative,
      if (certifications != null) 'resumejson:certifications': certifications,
    };
  }

  /// Returns a copy with the given fields replaced.
  LanguageProficiency copyWith({
    String? language,
    LanguageProficiencyLevel? proficiency,
    String? languageCode,
    bool? isNative,
    List<String>? certifications,
  }) {
    return LanguageProficiency(
      language: language ?? this.language,
      proficiency: proficiency ?? this.proficiency,
      languageCode: languageCode ?? this.languageCode,
      isNative: isNative ?? this.isNative,
      certifications: certifications ?? this.certifications,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguageProficiency &&
          runtimeType == other.runtimeType &&
          language == other.language &&
          proficiency == other.proficiency &&
          languageCode == other.languageCode &&
          isNative == other.isNative &&
          _listEquals(certifications, other.certifications);

  @override
  int get hashCode => Object.hash(
    language,
    proficiency,
    languageCode,
    isNative,
    certifications != null ? Object.hashAll(certifications!) : null,
  );

  @override
  String toString() =>
      'LanguageProficiency(language: $language, proficiency: ${proficiency.jsonValue})';
}

/// Whether [a] and [b] contain the same elements in the same order.
bool _listEquals<T>(List<T>? a, List<T>? b) {
  if (identical(a, b)) return true;
  if (a == null || b == null) return false;
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
