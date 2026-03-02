# resumejson

[![pub package](https://img.shields.io/pub/v/resumejson.svg)](https://pub.dev/packages/resumejson)
[![pub points](https://img.shields.io/pub/points/resumejson)](https://pub.dev/packages/resumejson/score)
[![license](https://img.shields.io/github/license/dancingskylab/resumejson)](LICENSE)

Reference Dart type library for the [ResumeJSON](https://auth.careers/schema/)
structured resume format — Version 0.1.0.

## Features

- **Immutable data classes** with `const` constructors for every entity block
  type defined in the specification.
- **`copyWith()`** methods for functional-style immutable updates.
- **`fromJson()` / `toJson()`** for JSON-LD round-tripping with proper
  `@context`, `@type`, and `resumejson:` namespace keys.
- **Value equality** via `==` and `hashCode` overrides.
- **Dart enums** for all constrained string fields.
- **Type-safe parsing** with descriptive `FormatException` messages — no raw `as` casts.
- **Zero external dependencies** — depends only on the Dart SDK.
- **Cross-platform** — Flutter, server-side Dart, CLI, web, and embedded.

## Getting Started

```yaml
dependencies:
  resumejson: ^0.1.0
```

## Usage

```dart
import 'package:resumejson/resumejson.dart';

// Create a resume
final resume = StructuredResume(
  about: const PersonIdentity(
    givenName: 'Jane',
    familyName: 'Doe',
    name: 'Jane Doe',
    jobTitle: 'Software Engineer',
  ),
  skills: const [
    Skill(name: 'Dart', category: SkillCategory.language),
  ],
);

// Serialize to JSON-LD
final json = resume.toJson();

// Deserialize from JSON-LD
final parsed = StructuredResume.fromJson(json);

assert(resume == parsed); // Value equality holds
```

## Entity Block Types

| Class | Schema.org Type | Spec Section |
|---|---|---|
| `StructuredResume` | `CreativeWork` | §3 |
| `PersonIdentity` | `Person` | §3.1 |
| `PostalAddress` | `PostalAddress` | §3.2 |
| `ContactPoint` | `ContactPoint` | §3.3 |
| `SocialProfile` | `resumejson:SocialProfile` | §3.4 |
| `Organization` | `Organization` | §3.5 |
| `WorkExperience` | `OrganizationRole` | §3.6 |
| `Education` | `EducationalOccupationalCredential` | §3.7 |
| `Skill` | `DefinedTerm` | §3.8 |
| `Certification` | `EducationalOccupationalCredential` | §3.9 |
| `Project` | `CreativeWork` | §3.10 |
| `Volunteering` | `OrganizationRole` | §3.11 |
| `Award` | `resumejson:Award` | §3.12 |
| `LanguageProficiency` | `resumejson:LanguageProficiency` | §3.13 |
| `Publication` | `ScholarlyArticle` | §3.14 |

## Platforms

This is a pure Dart package with zero dependencies — it works everywhere Dart runs:

| Platform | Supported |
|---|---|
| Flutter (iOS, Android, Web, Desktop) | ✅ |
| Server-side Dart | ✅ |
| CLI tools | ✅ |
| Web (dart2js / dart2wasm) | ✅ |

## Additional Information

- **Specification**: [auth.careers/schema](https://auth.careers/schema/)
- **Issues**: [GitHub Issues](https://github.com/dancingskylab/resumejson/issues)
- **Contributing**: PRs welcome — please file an issue first to discuss changes.

## License

BSD-3-Clause — see [LICENSE](LICENSE).
