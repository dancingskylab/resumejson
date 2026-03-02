import 'package:resumejson/resumejson.dart';
import 'package:test/test.dart';

void main() {
  group('ContactPoint', () {
    const email = ContactPoint(
      contactType: ContactType.email,
      email: 'jane@example.com',
      label: 'Personal',
    );
    const phone = ContactPoint(
      contactType: ContactType.phone,
      telephone: '+1-555-012-3456',
    );
    const fax = ContactPoint(
      contactType: ContactType.fax,
      faxNumber: '+1-555-999-0000',
    );
    const website = ContactPoint(
      contactType: ContactType.website,
      url: 'https://example.com',
    );

    test('construction with email type.', () {
      expect(email.contactType, ContactType.email);
      expect(email.email, 'jane@example.com');
      expect(email.label, 'Personal');
      expect(email.telephone, isNull);
    });

    test('value equality.', () {
      const a = ContactPoint(contactType: ContactType.email, email: 'a@b.com');
      const b = ContactPoint(contactType: ContactType.email, email: 'a@b.com');
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('inequality when fields differ.', () {
      expect(email, isNot(equals(phone)));
    });

    test('inequality with different type.', () {
      expect(email == Object(), isFalse);
    });

    test('copyWith replaces specified fields.', () {
      final copy = email.copyWith(label: 'Work');
      expect(copy.email, 'jane@example.com');
      expect(copy.label, 'Work');
    });

    test('copyWith with no arguments returns equal instance.', () {
      expect(email.copyWith(), equals(email));
    });

    test('toJson for email includes label.', () {
      final json = email.toJson();
      expect(json['@type'], 'ContactPoint');
      expect(json['contactType'], 'email');
      expect(json['email'], 'jane@example.com');
      expect(json['resumejson:label'], 'Personal');
    });

    test('toJson for phone.', () {
      final json = phone.toJson();
      expect(json['telephone'], '+1-555-012-3456');
      expect(json.containsKey('email'), isFalse);
    });

    test('toJson for fax.', () {
      final json = fax.toJson();
      expect(json['faxNumber'], '+1-555-999-0000');
    });

    test('toJson for website.', () {
      final json = website.toJson();
      expect(json['url'], 'https://example.com');
    });

    test('fromJson round-trip preserves all fields.', () {
      expect(ContactPoint.fromJson(email.toJson()), equals(email));
      expect(ContactPoint.fromJson(phone.toJson()), equals(phone));
    });

    test('toString contains class name and contact type.', () {
      expect(email.toString(), contains('ContactPoint'));
      expect(email.toString(), contains('email'));
    });

    test('hashCode is consistent.', () {
      expect(email.hashCode, equals(email.hashCode));
    });

    test('copyWith replaces all fields at once.', () {
      final copy = email.copyWith(
        contactType: ContactType.phone,
        email: 'new@example.com',
        telephone: '+1-555-000-0000',
        faxNumber: '+1-555-111-1111',
        url: 'https://new.com',
        label: 'Work',
      );
      expect(copy.contactType, ContactType.phone);
      expect(copy.email, 'new@example.com');
      expect(copy.telephone, '+1-555-000-0000');
      expect(copy.label, 'Work');
    });

    test('hashCode differs for different instances.', () {
      expect(email.hashCode, isNot(equals(phone.hashCode)));
    });

    test('fromJson round-trip for fax.', () {
      expect(ContactPoint.fromJson(fax.toJson()), equals(fax));
    });

    test('fromJson round-trip for website.', () {
      expect(ContactPoint.fromJson(website.toJson()), equals(website));
    });
  });
}
