import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('Publication', () {
    const full = Publication(
      headline: 'Scaling Microservices',
      datePublished: '2023-03-15',
      publisher: Organization(name: 'IEEE'),
      url: 'https://doi.org/10.1234',
      publicationType: PublicationType.conferencePaper,
      coAuthors: ['Alice Smith', 'Bob Jones'],
      doi: '10.1234/ms.2023',
    );
    const minimal = Publication(headline: 'My Blog Post');

    test('construction with all fields.', () {
      expect(full.publisher?.name, 'IEEE');
      expect(full.publicationType, PublicationType.conferencePaper);
      expect(full.coAuthors, hasLength(2));
      expect(full.doi, '10.1234/ms.2023');
    });

    test('construction with required fields only.', () {
      expect(minimal.datePublished, isNull);
      expect(minimal.publisher, isNull);
      expect(minimal.url, isNull);
      expect(minimal.publicationType, isNull);
      expect(minimal.coAuthors, isNull);
      expect(minimal.doi, isNull);
    });

    test('value equality.', () {
      const a = Publication(headline: 'X');
      const b = Publication(headline: 'X');
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('inequality with different type.', () {
      expect(full == Object(), isFalse);
    });

    test('inequality on list fields.', () {
      final a = full.copyWith(coAuthors: ['Only Me']);
      expect(a, isNot(equals(full)));
    });

    test('inequality when one coAuthors list is null.', () {
      expect(full, isNot(equals(minimal)));
    });

    test('copyWith replaces specified fields.', () {
      final copy = minimal.copyWith(
        datePublished: '2024-01-01',
        publicationType: PublicationType.blogPost,
      );
      expect(copy.headline, 'My Blog Post');
      expect(copy.datePublished, '2024-01-01');
      expect(copy.publicationType, PublicationType.blogPost);
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(full.copyWith(), equals(full));
    });

    test('toJson includes @type ScholarlyArticle.', () {
      final json = full.toJson();
      expect(json['@type'], 'ScholarlyArticle');
      expect(json['headline'], 'Scaling Microservices');
      expect(json['datePublished'], '2023-03-15');
      expect(json['publisher'], isA<Map>());
      expect(json['resumejson:publicationType'], 'conference_paper');
      expect(json['resumejson:coAuthors'], hasLength(2));
      expect(json['resumejson:doi'], '10.1234/ms.2023');
    });

    test('toJson omits null optional fields.', () {
      final json = minimal.toJson();
      expect(json.containsKey('datePublished'), isFalse);
      expect(json.containsKey('publisher'), isFalse);
      expect(json.containsKey('resumejson:coAuthors'), isFalse);
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(Publication.fromJson(full.toJson()), equals(full));
    });

    test('toString contains class name.', () {
      expect(full.toString(), contains('Publication'));
      expect(full.toString(), contains('Scaling Microservices'));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = full.copyWith(
        headline: 'New',
        datePublished: '2025-01-01',
        publisher: const Organization(name: 'ACM'),
        url: 'https://acm.org/new',
        publicationType: PublicationType.journalArticle,
        coAuthors: ['Charlie'],
        doi: '10.5678/new',
      );
      expect(copy.headline, 'New');
      expect(copy.publisher?.name, 'ACM');
      expect(copy.coAuthors, ['Charlie']);
    });

    test('hashCode on minimal instance with null lists.', () {
      expect(minimal.hashCode, isA<int>());
    });

    test('fromJson with minimal fields.', () {
      final parsed = Publication.fromJson(minimal.toJson());
      expect(parsed, equals(minimal));
    });

    test('inequality when list lengths differ.', () {
      final a = full.copyWith(coAuthors: ['A', 'B', 'C']);
      expect(a, isNot(equals(full)));
    });
  });
}
