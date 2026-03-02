/// Reference Dart type library for the ResumeJSON structured resume format.
///
/// Provides immutable data classes with `const` constructors, `copyWith()`
/// methods, `fromJson()` / `toJson()` serialization, and value equality for
/// every entity block type defined in the ResumeJSON specification.
///
/// Zero external dependencies — depends only on the Dart SDK.
///
/// ## Usage
///
/// ```dart
/// import 'package:resumejson/resumejson.dart';
///
/// final resume = StructuredResume(
///   about: PersonIdentity(
///     givenName: 'Jane',
///     familyName: 'Doe',
///     name: 'Jane Doe',
///     jobTitle: 'Software Engineer',
///   ),
/// );
///
/// // Serialize to JSON-LD
/// final json = resume.toJson();
///
/// // Deserialize from JSON-LD
/// final parsed = StructuredResume.fromJson(json);
///
/// assert(resume == parsed); // Value equality
/// ```
library;

export 'src/award.dart';
export 'src/certification.dart';
export 'src/contact_point.dart';
export 'src/education.dart';
export 'src/enums.dart';
export 'src/json_helpers.dart';
export 'src/language_proficiency.dart';
export 'src/organization.dart';
export 'src/person_identity.dart';
export 'src/postal_address.dart';
export 'src/project.dart';
export 'src/publication.dart';
export 'src/skill.dart';
export 'src/social_profile.dart';
export 'src/structured_resume.dart';
export 'src/volunteering.dart';
export 'src/work_experience.dart';
