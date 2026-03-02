import 'package:resumejson/src/enums.dart';
import 'package:resumejson/src/json_helpers.dart';
import 'package:resumejson/src/organization.dart';

/// A paper, article, blog post, patent, or talk (§3.14).
///
/// Maps to Schema.org `ScholarlyArticle`.
class Publication {
  /// Creates a [Publication].
  ///
  /// [headline] is required.
  const Publication({
    required this.headline,
    this.datePublished,
    this.publisher,
    this.url,
    this.publicationType,
    this.coAuthors,
    this.doi,
  });

  /// Deserializes a [Publication] from a JSON map.
  ///
  /// Throws [FormatException] if required fields are missing or have the
  /// wrong type.
  factory Publication.fromJson(Map<String, dynamic> json) {
    final publisherMap = optionalMap(json, 'publisher');
    final ptStr = optionalString(json, 'resumejson:publicationType');
    return Publication(
      headline: requireString(json, 'headline'),
      datePublished: optionalString(json, 'datePublished'),
      publisher: publisherMap != null
          ? Organization.fromJson(publisherMap)
          : null,
      url: optionalString(json, 'url'),
      publicationType: ptStr != null ? PublicationType.fromJson(ptStr) : null,
      coAuthors: optionalStringList(json, 'resumejson:coAuthors'),
      doi: optionalString(json, 'resumejson:doi'),
    );
  }

  /// Title of the publication.
  final String headline;

  /// Publication date.
  final String? datePublished;

  /// The publisher organization.
  final Organization? publisher;

  /// URL to the publication.
  final String? url;

  /// Type of publication.
  final PublicationType? publicationType;

  /// Co-author names.
  final List<String>? coAuthors;

  /// Digital Object Identifier.
  final String? doi;

  /// Serializes this [Publication] to a JSON-LD map.
  Map<String, dynamic> toJson() {
    return {
      '@type': 'ScholarlyArticle',
      'headline': headline,
      if (datePublished != null) 'datePublished': datePublished,
      if (publisher != null) 'publisher': publisher!.toJson(),
      if (url != null) 'url': url,
      if (publicationType != null)
        'resumejson:publicationType': publicationType!.jsonValue,
      if (coAuthors != null) 'resumejson:coAuthors': coAuthors,
      if (doi != null) 'resumejson:doi': doi,
    };
  }

  /// Returns a copy with the given fields replaced.
  Publication copyWith({
    String? headline,
    String? datePublished,
    Organization? publisher,
    String? url,
    PublicationType? publicationType,
    List<String>? coAuthors,
    String? doi,
  }) {
    return Publication(
      headline: headline ?? this.headline,
      datePublished: datePublished ?? this.datePublished,
      publisher: publisher ?? this.publisher,
      url: url ?? this.url,
      publicationType: publicationType ?? this.publicationType,
      coAuthors: coAuthors ?? this.coAuthors,
      doi: doi ?? this.doi,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Publication &&
          runtimeType == other.runtimeType &&
          headline == other.headline &&
          datePublished == other.datePublished &&
          publisher == other.publisher &&
          url == other.url &&
          publicationType == other.publicationType &&
          _listEquals(coAuthors, other.coAuthors) &&
          doi == other.doi;

  @override
  int get hashCode => Object.hash(
    headline,
    datePublished,
    publisher,
    url,
    publicationType,
    coAuthors != null ? Object.hashAll(coAuthors!) : null,
    doi,
  );

  @override
  String toString() => 'Publication(headline: $headline)';
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
