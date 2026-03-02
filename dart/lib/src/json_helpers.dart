// Helpers for type-safe JSON deserialization without raw `as` casts.
//
// Every function validates the runtime type and throws a [FormatException]
// with a human-readable message naming the offending key when the value is
// missing or has the wrong type.

/// Reads a required [String] value from [json] at [key].
///
/// Throws [FormatException] if the key is absent, null, or not a [String].
String requireString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is String) return value;
  if (value == null) {
    throw FormatException('Missing required field "$key".', json);
  }
  throw FormatException(
    'Expected String for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [String] value from [json] at [key].
///
/// Returns `null` if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is present but not a [String].
String? optionalString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  if (value is String) return value;
  throw FormatException(
    'Expected String for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads a required [Map] value from [json] at [key].
///
/// Throws [FormatException] if the key is absent, null, or not a [Map].
Map<String, dynamic> requireMap(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is Map<String, dynamic>) return value;
  if (value == null) {
    throw FormatException('Missing required field "$key".', json);
  }
  throw FormatException(
    'Expected Map for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [Map] value from [json] at [key].
///
/// Returns `null` if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is present but not a [Map].
Map<String, dynamic>? optionalMap(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  if (value is Map<String, dynamic>) return value;
  throw FormatException(
    'Expected Map for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [bool] value from [json] at [key].
///
/// Returns [defaultValue] if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is present but not a [bool].
bool optionalBool(
  Map<String, dynamic> json,
  String key, {
  bool defaultValue = false,
}) {
  final value = json[key];
  if (value == null) return defaultValue;
  if (value is bool) return value;
  throw FormatException(
    'Expected bool for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [int] value from [json] at [key].
///
/// Returns `null` if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is present but not an [int].
int? optionalInt(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  if (value is int) return value;
  throw FormatException(
    'Expected int for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [List] of [String] values from [json] at [key].
///
/// Returns `null` if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is not a [List] or contains
/// non-[String] elements.
List<String>? optionalStringList(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  if (value is List<dynamic>) {
    return [
      for (var i = 0; i < value.length; i++)
        switch (value[i]) {
          final String s => s,
          final other => throw FormatException(
            'Expected String at "$key[$i]", '
            'got ${other.runtimeType}.',
            json,
          ),
        },
    ];
  }
  throw FormatException(
    'Expected List for "$key", got ${value.runtimeType}.',
    json,
  );
}

/// Reads an optional [List] of [String] values, defaulting to an empty list.
///
/// Returns `const []` if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is not a [List] or contains
/// non-[String] elements.
List<String> optionalStringListOrEmpty(Map<String, dynamic> json, String key) {
  return optionalStringList(json, key) ?? const [];
}

/// Reads an optional [List] of [Map] values from [json] at [key].
///
/// Returns an empty list if the key is absent or the value is `null`.
/// Throws [FormatException] if the value is not a [List] or any element
/// is not a [Map<String, dynamic>].
List<Map<String, dynamic>> optionalMapList(
  Map<String, dynamic> json,
  String key,
) {
  final value = json[key];
  if (value == null) return const [];
  if (value is List<dynamic>) {
    return [
      for (var i = 0; i < value.length; i++)
        switch (value[i]) {
          final Map<String, dynamic> m => m,
          final other => throw FormatException(
            'Expected Map at "$key[$i]", '
            'got ${other.runtimeType}.',
            json,
          ),
        },
    ];
  }
  throw FormatException(
    'Expected List for "$key", got ${value.runtimeType}.',
    json,
  );
}
