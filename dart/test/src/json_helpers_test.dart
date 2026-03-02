import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('requireString', () {
    test('returns value when present and is a String.', () {
      expect(requireString({'k': 'v'}, 'k'), 'v');
    });

    test('throws FormatException when key is missing.', () {
      expect(
        () => requireString(<String, dynamic>{}, 'k'),
        throwsFormatException,
      );
    });

    test('throws FormatException when value is wrong type.', () {
      expect(() => requireString({'k': 42}, 'k'), throwsFormatException);
    });
  });

  group('optionalString', () {
    test('returns value when present and is a String.', () {
      expect(optionalString({'k': 'v'}, 'k'), 'v');
    });

    test('returns null when key is absent.', () {
      expect(optionalString(<String, dynamic>{}, 'k'), isNull);
    });

    test('returns null when value is null.', () {
      expect(optionalString({'k': null}, 'k'), isNull);
    });

    test('throws FormatException when value is wrong type.', () {
      expect(() => optionalString({'k': 42}, 'k'), throwsFormatException);
    });
  });

  group('requireMap', () {
    test('returns value when present and is a Map.', () {
      final map = <String, dynamic>{'a': 1};
      expect(requireMap({'k': map}, 'k'), map);
    });

    test('throws FormatException when key is missing.', () {
      expect(() => requireMap(<String, dynamic>{}, 'k'), throwsFormatException);
    });

    test('throws FormatException when value is wrong type.', () {
      expect(() => requireMap({'k': 'not a map'}, 'k'), throwsFormatException);
    });
  });

  group('optionalMap', () {
    test('returns value when present and is a Map.', () {
      final map = <String, dynamic>{'a': 1};
      expect(optionalMap({'k': map}, 'k'), map);
    });

    test('returns null when key is absent.', () {
      expect(optionalMap(<String, dynamic>{}, 'k'), isNull);
    });

    test('returns null when value is null.', () {
      expect(optionalMap({'k': null}, 'k'), isNull);
    });

    test('throws FormatException when value is wrong type.', () {
      expect(() => optionalMap({'k': 'not a map'}, 'k'), throwsFormatException);
    });
  });

  group('optionalBool', () {
    test('returns value when present and is a bool.', () {
      expect(optionalBool({'k': true}, 'k'), isTrue);
    });

    test('returns default when key is absent.', () {
      expect(optionalBool(<String, dynamic>{}, 'k'), isFalse);
    });

    test('returns custom default when key is absent.', () {
      expect(
        optionalBool(<String, dynamic>{}, 'k', defaultValue: true),
        isTrue,
      );
    });

    test('returns null-default when value is null.', () {
      expect(optionalBool({'k': null}, 'k'), isFalse);
    });

    test('throws FormatException when value is wrong type.', () {
      expect(
        () => optionalBool({'k': 'not a bool'}, 'k'),
        throwsFormatException,
      );
    });
  });

  group('optionalInt', () {
    test('returns value when present and is an int.', () {
      expect(optionalInt({'k': 42}, 'k'), 42);
    });

    test('returns null when key is absent.', () {
      expect(optionalInt(<String, dynamic>{}, 'k'), isNull);
    });

    test('returns null when value is null.', () {
      expect(optionalInt({'k': null}, 'k'), isNull);
    });

    test('throws FormatException when value is wrong type.', () {
      expect(
        () => optionalInt({'k': 'not an int'}, 'k'),
        throwsFormatException,
      );
    });
  });

  group('optionalStringList', () {
    test('returns list when present and all elements are Strings.', () {
      expect(
        optionalStringList({
          'k': ['a', 'b'],
        }, 'k'),
        ['a', 'b'],
      );
    });

    test('returns null when key is absent.', () {
      expect(optionalStringList(<String, dynamic>{}, 'k'), isNull);
    });

    test('returns null when value is null.', () {
      expect(optionalStringList({'k': null}, 'k'), isNull);
    });

    test('throws FormatException when value is not a List.', () {
      expect(
        () => optionalStringList({'k': 'not a list'}, 'k'),
        throwsFormatException,
      );
    });

    test('throws FormatException when element is not a String.', () {
      expect(
        () => optionalStringList({
          'k': ['a', 42],
        }, 'k'),
        throwsFormatException,
      );
    });
  });

  group('optionalStringListOrEmpty', () {
    test('returns list when present.', () {
      expect(
        optionalStringListOrEmpty({
          'k': ['a'],
        }, 'k'),
        ['a'],
      );
    });

    test('returns empty list when key is absent.', () {
      expect(optionalStringListOrEmpty(<String, dynamic>{}, 'k'), isEmpty);
    });
  });

  group('optionalMapList', () {
    test('returns list of maps when present and valid.', () {
      final maps = [
        <String, dynamic>{'a': 1},
        <String, dynamic>{'b': 2},
      ];
      expect(optionalMapList({'k': maps}, 'k'), maps);
    });

    test('returns empty list when key is absent.', () {
      expect(optionalMapList(<String, dynamic>{}, 'k'), isEmpty);
    });

    test('returns empty list when value is null.', () {
      expect(optionalMapList({'k': null}, 'k'), isEmpty);
    });

    test('throws FormatException when value is not a List.', () {
      expect(
        () => optionalMapList({'k': 'not a list'}, 'k'),
        throwsFormatException,
      );
    });

    test('throws FormatException when element is not a Map.', () {
      expect(
        () => optionalMapList({
          'k': ['not a map'],
        }, 'k'),
        throwsFormatException,
      );
    });
  });
}
