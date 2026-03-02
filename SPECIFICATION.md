# The ResumeJSON Format

**Draft Specification — Version 0.1.0**

C. Mercredi, Dancing Sky Labs Inc.
March 2026

## Abstract

ResumeJSON ("Resume JSON") is a structured data interchange format for
professional resumes and curricula vitae based on JavaScript Object
Notation (JSON) [RFC8259] and JSON-LD [JSON-LD11]. It defines several
types of JSON objects and the manner in which they are combined to
represent a person's professional identity, work history, education,
skills, and related career information. ResumeJSON uses the Schema.org
vocabulary as its base and extends it with a `resumejson:` namespace for
resume-specific semantics.

## 1. Introduction

ResumeJSON is a format for encoding a variety of career data structures
using JSON-LD. A ResumeJSON object represents a complete structured resume
(a StructuredResume). It is composed of entity blocks — typed JSON objects
that each describe one aspect of a candidate's professional profile.

ResumeJSON supports the following entity block types: PersonIdentity,
PostalAddress, ContactPoint, SocialProfile, Organization,
WorkExperience, Education, Skill, Certification, Project, Volunteering,
Award, LanguageProficiency, and Publication. Entity blocks with
additional properties are composed into a StructuredResume object.

The format is concerned with career data in the broadest sense; anything
that a candidate might include on a resume or CV is within scope. The
concepts in ResumeJSON are not new; they are derived from Schema.org, the
world's most widely deployed structured data vocabulary, and have been
streamlined to suit resume data interchange across platforms and tools.

```json
{
  "@context": {
    "@vocab": "https://schema.org/",
    "resumejson": "https://auth.careers/schema/"
  },
  "@type": "CreativeWork",
  "additionalType": "resumejson:StructuredResume",
  "about": {
    "@type": "Person",
    "givenName": "Jane",
    "familyName": "Doe",
    "name": "Jane Doe",
    "jobTitle": "Software Engineer"
  },
  "resumejson:workExperience": [
    {
      "@type": "OrganizationRole",
      "roleName": "Senior Software Engineer",
      "startDate": "2021-03",
      "memberOf": {
        "@type": "Organization",
        "name": "Acme Corp"
      },
      "resumejson:responsibilities": [
        "Designed distributed services handling 50k req/s"
      ],
      "keywords": ["Go", "Kubernetes", "gRPC"]
    }
  ]
}
```

### 1.1. Requirements Language

The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT",
"SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY", and "OPTIONAL" in this
document are to be interpreted as described in [RFC 2119].

### 1.2. Conventions Used in This Document

The ordering of the members of any JSON object defined in this document
MAY be in any order.

Some examples use the combination of a JavaScript single-line comment
(`//`) followed by an ellipsis (`...`) as a placeholder for content
deemed irrelevant by the authors. These placeholders MUST of course be
removed or replaced with valid content to form a valid ResumeJSON
document.

### 1.3. Specification of ResumeJSON

This document supersedes any prior specification of the ResumeJSON format.
It defines the format and is the authoritative specification.

### 1.4. Definitions

- **JSON-LD context**: A mapping of terms to IRIs, embedded in every
  ResumeJSON document via the `@context` member.
- **Namespace IRI**: `https://auth.careers/schema/` — the IRI for the
  `resumejson:` prefix.
- **Entity block**: A typed JSON object representing one section of a
  resume (e.g., a single work experience entry, a single skill).
- **StructuredResume**: The root object that composes all entity blocks
  into a single document.
- **Organization**: A normalised entity used wherever an organization is
  referenced — as employer, school, certifying body, publisher, or
  award grantor.

### 1.5. Example

A complete, minimal ResumeJSON document:

```json
{
  "@context": {
    "@vocab": "https://schema.org/",
    "resumejson": "https://auth.careers/schema/"
  },
  "@type": "CreativeWork",
  "additionalType": "resumejson:StructuredResume",
  "about": {
    "@type": "Person",
    "givenName": "Jane",
    "familyName": "Doe",
    "name": "Jane Doe"
  }
}
```

## 2. ResumeJSON Text

A ResumeJSON text is a JSON text as defined in [RFC8259] whose value is a
single ResumeJSON object.

A ResumeJSON text MUST use the UTF-8 encoding [RFC3629]. No byte order
mark (BOM) SHOULD be present.

A conforming ResumeJSON document SHOULD use the file extension
`.resume.json`. The informational media type is
`application/resume+json`.

## 3. ResumeJSON Object

A ResumeJSON object represents a structured resume. It is a JSON object
that has the following required members:

- A member with the name `"@context"` whose value is an object
  containing `"@vocab": "https://schema.org/"` and
  `"resumejson": "https://auth.careers/schema/"`.
- A member with the name `"@type"` whose value MUST be the string
  `"CreativeWork"`.
- A member with the name `"additionalType"` whose value MUST be the
  string `"resumejson:StructuredResume"`.
- A member with the name `"about"` whose value is a PersonIdentity
  object (Section 3.1).

A ResumeJSON object MAY have any number of the following optional members:

- `"resumejson:address"` — a PostalAddress object (Section 3.2).
- `"resumejson:contactPoints"` — an array of ContactPoint objects (Section 3.3).
- `"resumejson:socialProfiles"` — an array of SocialProfile objects (Section 3.4).
- `"resumejson:workExperience"` — an array of WorkExperience objects (Section 3.6).
- `"resumejson:education"` — an array of Education objects (Section 3.7).
- `"resumejson:skills"` — an array of Skill objects (Section 3.8).
- `"resumejson:certifications"` — an array of Certification objects (Section 3.9).
- `"resumejson:projects"` — an array of Project objects (Section 3.10).
- `"resumejson:volunteering"` — an array of Volunteering objects (Section 3.11).
- `"resumejson:awards"` — an array of Award objects (Section 3.12).
- `"resumejson:languages"` — an array of LanguageProficiency objects (Section 3.13).
- `"resumejson:publications"` — an array of Publication objects (Section 3.14).

### 3.1. PersonIdentity

Maps to Schema.org `Person`.

A PersonIdentity object represents the subject of the resume. It MUST
have the following members:

- `"@type"` — MUST be `"Person"`.
- `"givenName"` — the person's given (first) name, a string.
- `"familyName"` — the person's family (last) name, a string.
- `"name"` — the full display name as it appears on the resume, a
  string.

A PersonIdentity object MAY have the following members:

- `"additionalName"` — middle name or initial, a string.
- `"honorificPrefix"` — title prefix (e.g., "Dr."), a string.
- `"honorificSuffix"` — title suffix (e.g., "PhD", "Jr."), a string.
- `"jobTitle"` — current or target professional title, a string.
- `"description"` — professional summary or objective statement, a
  string.
- `"image"` — URL of a headshot or profile photo, a string.

### 3.2. PostalAddress

Maps to Schema.org `PostalAddress`.

A PostalAddress object represents a physical mailing address. It MUST
have the following member:

- `"@type"` — MUST be `"PostalAddress"`.
- `"addressLocality"` — city or town, a string.

A PostalAddress object MAY have the following members:

- `"streetAddress"` — street number and name, a string.
- `"addressRegion"` — state, province, or region, a string.
- `"postalCode"` — ZIP or postal code, a string.
- `"addressCountry"` — country name or ISO 3166-1 alpha-2 code, a
  string.

### 3.3. ContactPoint

Maps to Schema.org `ContactPoint`.

A ContactPoint object represents a single contact method. It MUST have
the following members:

- `"@type"` — MUST be `"ContactPoint"`.
- `"contactType"` — one of `"email"`, `"phone"`, `"fax"`, or
  `"website"`, a string.

When `"contactType"` is `"email"`, the member `"email"` MUST be present.
When `"contactType"` is `"phone"`, the member `"telephone"` MUST be
present. When `"contactType"` is `"fax"`, the member `"faxNumber"` MUST
be present. When `"contactType"` is `"website"`, the member `"url"` MUST
be present.

A ContactPoint object MAY have the following member:

- `"resumejson:label"` — a human-readable label for this contact method
  (e.g., "Work Phone"), a string.

### 3.4. SocialProfile

Maps to `resumejson:SocialProfile`.

A SocialProfile object represents a social media or professional
profile link. It MUST have the following members:

- `"@type"` — MUST be `"resumejson:SocialProfile"`.
- `"resumejson:platform"` — one of: `"linkedin"`, `"github"`,
  `"twitter"`, `"portfolio"`, `"stackoverflow"`, `"dribbble"`,
  `"behance"`, `"medium"`, `"youtube"`, `"kaggle"`, `"devto"`,
  `"personal_website"`, `"other"` — a string.
- `"url"` — the full URL to the profile, a string.

A SocialProfile object MAY have the following members:

- `"resumejson:username"` — the username or handle, a string.
- `"resumejson:displayText"` — display text as it appeared on the source
  resume, a string.

### 3.5. Organization

Maps to Schema.org `Organization`.

An Organization object is a normalised entity used wherever an
organization is referenced. A single Organization definition is shared
across work experience, education, certifications, volunteering, awards,
and publications. This avoids duplication and ensures consistency.

An Organization object MUST have the following members:

- `"@type"` — MUST be `"Organization"`.
- `"name"` — the organization's name, a string.

An Organization object MAY have the following members:

- `"url"` — the organization's website, a string.
- `"location"` — an object containing an `"address"` member, which
  itself is a PostalAddress object (Section 3.2). Only
  `"addressLocality"`, `"addressRegion"`, and `"addressCountry"` are
  relevant in this context.
- `"resumejson:cause"` — the mission or cause of the organization
  (primarily used for volunteer organizations), a string.

```json
{
  "@type": "Organization",
  "name": "Acme Corp",
  "url": "https://acme.example.com",
  "location": {
    "address": {
      "@type": "PostalAddress",
      "addressLocality": "San Francisco",
      "addressRegion": "CA"
    }
  }
}
```

### 3.6. WorkExperience

Maps to Schema.org `OrganizationRole`.

A WorkExperience object represents a single position held at an
organization. It MUST have the following members:

- `"@type"` — MUST be `"OrganizationRole"`.
- `"roleName"` — the job title, a string.
- `"startDate"` — the start date in ISO 8601 partial date format
  (YYYY, YYYY-MM, or YYYY-MM-DD), a string.
- `"memberOf"` — an Organization object (Section 3.5).

When a WorkExperience object has no `"endDate"` member, or when its
value is null, the position SHOULD be interpreted as current.

A WorkExperience object MAY have the following members:

- `"endDate"` — ISO 8601 partial date, a string.
- `"description"` — a free-text summary of the role, a string.
- `"employmentType"` — one of: `"FULL_TIME"`, `"PART_TIME"`,
  `"CONTRACT"`, `"INTERNSHIP"`, `"FREELANCE"`, `"TEMPORARY"`,
  `"APPRENTICESHIP"`, `"SEASONAL"` — a string.
- `"resumejson:workLocationType"` — one of: `"remote"`, `"hybrid"`,
  `"office"`, `"unspecified"` — a string.
- `"resumejson:department"` — the department or team name, a string.
- `"resumejson:responsibilities"` — an array of responsibility bullet
  points, each a string.
- `"resumejson:achievements"` — an array of achievement bullet points,
  each a string.
- `"keywords"` — an array of technology, tool, or methodology names,
  each a string.

```json
{
  "@type": "OrganizationRole",
  "roleName": "Engineering Manager",
  "startDate": "2022-01",
  "memberOf": {
    "@type": "Organization",
    "name": "TechCo"
  },
  "employmentType": "FULL_TIME",
  "resumejson:responsibilities": [
    "Led a team of 8 engineers across 3 product squads"
  ],
  "resumejson:achievements": [
    "Reduced deploy cycle time by 40%"
  ],
  "keywords": ["Leadership", "Agile", "CI/CD"]
}
```

### 3.7. Education

Maps to Schema.org `EducationalOccupationalCredential`.

An Education object represents a single educational credential. It
MUST have the following members:

- `"@type"` — MUST be `"EducationalOccupationalCredential"`.
- `"credentialCategory"` — one of: `"bachelor"`, `"master"`,
  `"doctorate"`, `"associate"`, `"diploma"`, `"certificate"`,
  `"high_school"`, `"bootcamp"`, `"professional_degree"`,
  `"postdoctoral"`, `"other"` — a string.
- `"name"` — the full degree or credential name, a string.
- `"recognizedBy"` — an Organization object (Section 3.5) representing
  the awarding institution.

An Education object MAY have the following members:

- `"about"` — the field of study or major, a string.
- `"resumejson:minor"` — a minor or secondary concentration, a string.
- `"resumejson:specialization"` — a specialization within the major, a
  string.
- `"startDate"` — program start date, a string.
- `"dateCreated"` — graduation date, a string.
- `"resumejson:expectedGraduation"` — expected graduation date if not
  yet completed, a string.
- `"resumejson:gpa"` — grade point average as stated, a string.
- `"resumejson:honors"` — academic honors (e.g., "Cum Laude"), a string.
- `"resumejson:relevantCoursework"` — an array of relevant course names,
  each a string.
- `"resumejson:thesis"` — thesis or dissertation title, a string.
- `"resumejson:activities"` — an array of extracurricular activities,
  each a string.

### 3.8. Skill

Maps to Schema.org `DefinedTerm`.

A Skill object represents a single skill entry. It MUST have the
following members:

- `"@type"` — MUST be `"DefinedTerm"`.
- `"name"` — the skill name, a string.
- `"termCode"` — one of: `"technical"`, `"soft"`, `"language"`,
  `"tool"`, `"framework"`, `"methodology"`, `"domain"`, `"platform"`,
  `"database"`, `"cloud"`, `"other"` — a string.

A Skill object MAY have the following members:

- `"resumejson:proficiencyLevel"` — one of: `"beginner"`,
  `"intermediate"`, `"advanced"`, `"expert"` — a string.
- `"resumejson:yearsOfExperience"` — years of experience, a number.

### 3.9. Certification

Maps to Schema.org `EducationalOccupationalCredential` with
`"credentialCategory"` fixed to `"certification"`.

A Certification object represents a professional certification or
license. It MUST have the following members:

- `"@type"` — MUST be `"EducationalOccupationalCredential"`.
- `"credentialCategory"` — MUST be `"certification"`.
- `"name"` — the full certification name, a string.
- `"recognizedBy"` — an Organization object (Section 3.5) representing
  the issuing body.

A Certification object MAY have the following members:

- `"validFrom"` — date the certification was earned, a string.
- `"validThrough"` — expiration date, a string.
- `"resumejson:credentialId"` — credential ID or license number, a string.
- `"resumejson:verificationUrl"` — URL for verification, a string.

### 3.10. Project

Maps to Schema.org `CreativeWork` with `"additionalType"` set to
`"resumejson:Project"`.

A Project object represents a personal, academic, or open-source
project. It MUST have the following members:

- `"@type"` — MUST be `"CreativeWork"`.
- `"additionalType"` — MUST be `"resumejson:Project"`.
- `"name"` — the project name, a string.

A Project object MAY have the following members:

- `"description"` — a brief description, a string.
- `"url"` — URL to the project, a string.
- `"startDate"` — when the project started, a string.
- `"endDate"` — when the project completed (absent = ongoing), a
  string.
- `"resumejson:projectType"` — one of: `"personal"`, `"academic"`,
  `"open_source"`, `"freelance"`, `"hackathon"`, `"research"`,
  `"other"` — a string.
- `"resumejson:role"` — the candidate's role in the project, a string.
- `"keywords"` — an array of technology and tool names, each a string.

### 3.11. Volunteering

Maps to Schema.org `OrganizationRole` with `"additionalType"` set to
`"VolunteerRole"`.

A Volunteering object has the same structural shape as a WorkExperience
object (Section 3.6) but omits `"employmentType"` and
`"resumejson:workLocationType"`. The `"memberOf"` Organization
(Section 3.5) MAY include a `"resumejson:cause"` member describing the
organization's mission.

A Volunteering object MUST have the following members:

- `"@type"` — MUST be `"OrganizationRole"`.
- `"additionalType"` — MUST be `"VolunteerRole"`.
- `"roleName"` — the volunteer role title, a string.
- `"memberOf"` — an Organization object (Section 3.5).

A Volunteering object MAY have the following members:

- `"startDate"` — a string.
- `"endDate"` — a string.
- `"description"` — a string.
- `"resumejson:responsibilities"` — an array of strings.
- `"resumejson:achievements"` — an array of strings.

### 3.12. Award

Maps to `resumejson:Award`.

An Award object represents an honor or recognition. It MUST have the
following members:

- `"@type"` — MUST be `"resumejson:Award"`.
- `"name"` — the name of the award, a string.

An Award object MAY have the following members:

- `"description"` — additional context, a string.
- `"resumejson:awardedBy"` — an Organization object (Section 3.5).
- `"resumejson:dateAwarded"` — when the award was received, a string.

### 3.13. LanguageProficiency

Maps to `resumejson:LanguageProficiency`.

A LanguageProficiency object represents fluency in a spoken or written
language. It MUST have the following members:

- `"@type"` — MUST be `"resumejson:LanguageProficiency"`.
- `"resumejson:language"` — the language name, a string.
- `"resumejson:proficiency"` — one of: `"native"`, `"fluent"`,
  `"professional"`, `"intermediate"`, `"basic"` — a string.

A LanguageProficiency object MAY have the following members:

- `"resumejson:languageCode"` — ISO 639-1 two-letter code, a string.
- `"resumejson:isNative"` — whether this is the native language, a
  boolean. Default: false.
- `"resumejson:certifications"` — an array of language certification
  names, each a string.

### 3.14. Publication

Maps to Schema.org `ScholarlyArticle`.

A Publication object represents a paper, article, blog post, patent,
or talk. It MUST have the following members:

- `"@type"` — MUST be `"ScholarlyArticle"`.
- `"headline"` — the title of the publication, a string.

A Publication object MAY have the following members:

- `"datePublished"` — publication date, a string.
- `"publisher"` — an Organization object (Section 3.5).
- `"url"` — URL to the publication, a string.
- `"resumejson:publicationType"` — one of: `"journal_article"`,
  `"conference_paper"`, `"book_chapter"`, `"whitepaper"`,
  `"blog_post"`, `"patent"`, `"thesis"`, `"talk"`, `"poster"`,
  `"other"` — a string.
- `"resumejson:coAuthors"` — an array of co-author names, each a string.
- `"resumejson:doi"` — a Digital Object Identifier, a string.

## 4. Rendering Layer

### 4.1. Template Format

ResumeJSON defines a set of composable Handlebars [Handlebars] templates
embedded in Markdown files. A conforming renderer MUST correctly
process these templates to produce Markdown output.

### 4.2. Template Conventions

The root template (`structured-resume.md`) composes all entity block
partials. Each entity block has a corresponding partial template named
in kebab-case.

Sections SHOULD only render when data is present, using Handlebars
block syntax (`{{#sectionName}}...{{/sectionName}}`). Section
separators use Markdown horizontal rules (`---`). End dates that are
absent SHOULD render as "Present".

### 4.3. Partial Registry

The following partials are defined:

- `structured-resume` — Root (full resume composition)
- `person-identity` — PersonIdentity (name, title, summary)
- `postal-address` — PostalAddress (physical address)
- `contact-point` — ContactPoint (single contact method)
- `social-profile` — SocialProfile (single social link)
- `work-experience` — WorkExperience (single position)
- `education` — Education (single credential)
- `skill` — Skill (single skill entry)
- `certification` — Certification (single certification)
- `project` — Project (single project)
- `volunteering` — Volunteering (single volunteer role)
- `award` — Award (single award)
- `language-proficiency` — LanguageProficiency (single language)
- `publication` — Publication (single publication)

## 5. Type System

### 5.1. Dart Types

The specification includes a Dart type library (`package:resumejson`)
that serves as the reference implementation for serialization behavior.
The library provides:

- Immutable data classes with `const` constructors.
- `copyWith()` methods on every class for functional-style immutable
  updates.
- `factory fromJson()` constructors and `toJson()` methods for JSON
  round-tripping.
- Value equality via `==` and `hashCode` overrides.
- Dart enums for all constrained string fields.
- A shared, normalised `Organization` class.
- Cross-platform compatibility: Flutter, server-side Dart, CLI, web,
  and embedded targets.

The Dart library depends only on the Dart SDK; it has zero external
dependencies.

### 5.2. Future Language Bindings

Future versions of this specification MAY include type definitions for
additional languages (TypeScript, Python, Kotlin, Swift, etc.). All
language bindings MUST produce conforming JSON-LD documents when
serialized.

## 6. Extending ResumeJSON

### 6.1. Foreign Members

Members not described in this specification ("foreign members") MAY be
used in a ResumeJSON document. Implementations SHOULD NOT omit foreign
members when re-serializing a document. Semantics of foreign members
are outside the scope of this specification.

Implementations wishing to add custom semantics SHOULD declare their
own namespace prefix in the `"@context"` object. Custom properties
MUST NOT use the `"resumejson:"` prefix.

```json
{
  "@context": {
    "@vocab": "https://schema.org/",
    "resumejson": "https://auth.careers/schema/",
    "myapp": "https://myapp.example.com/schema/"
  },
  "myapp:customField": "custom value"
}
```

## 7. ResumeJSON Types Are Not Extensible

Implementations MUST NOT extend the set of ResumeJSON entity block types
beyond those defined in this specification. Adding new entity block
types requires a revision of this specification.

Implementations MAY add foreign members (Section 6.1) to any existing
entity block type.

## 8. Versioning

This specification follows Semantic Versioning 2.0.0 [SemVer].
Breaking changes to the schema or template format increment the MAJOR
version number.

No versioning member is required in a ResumeJSON document. The version
of the specification against which a document was created SHOULD be
recorded externally by the producing application.

## 9. Security Considerations

ResumeJSON documents MAY contain personally identifiable information
(PII) including names, addresses, email addresses, phone numbers, and
photographs. Implementations SHOULD handle documents according to
applicable privacy regulations (GDPR, CCPA, etc.).

Implementations SHOULD sanitize URL members to prevent injection
attacks when rendering documents in HTML or other executable contexts.

Implementations SHOULD NOT serve ResumeJSON documents over unencrypted
connections.

## 10. Interoperability Considerations

### 10.1. JSON-LD Compatibility

A ResumeJSON document is a valid JSON-LD document. JSON-LD processors
SHOULD be able to expand and compact ResumeJSON documents using standard
JSON-LD algorithms.

### 10.2. Schema.org Alignment

Entity block types use Schema.org types wherever a suitable mapping
exists. Properties without a Schema.org equivalent use the `resumejson:`
namespace prefix. This allows search engines and knowledge graphs that
understand Schema.org to partially interpret ResumeJSON documents without
specific ResumeJSON support.

## 11. IANA Considerations

The media type `application/resume+json` is proposed but not yet
registered with IANA. Until registration, implementations SHOULD use
`application/json` as a fallback.

## 12. References

### 12.1. Normative References

- [RFC2119] Bradner, S., "Key words for use in RFCs to Indicate
  Requirement Levels", BCP 14, RFC 2119, March 1997.
- [RFC8259] Bray, T., Ed., "The JavaScript Object Notation (JSON) Data
  Interchange Format", STD 90, RFC 8259, December 2017.
- [RFC3629] Yergeau, F., "UTF-8, a transformation format of ISO 10646",
  STD 63, RFC 3629, November 2003.
- [JSON-LD11] Sporny, M., Longley, D., Kellogg, G., Lanthaler, M., and
  N. Lindström, "JSON-LD 1.1", W3C Recommendation, July 2020.
- [Schema.org] Schema.org Community, "Schema.org",
  https://schema.org/.

### 12.2. Informative References

- [SemVer] Preston-Werner, T., "Semantic Versioning 2.0.0",
  https://semver.org/.
- [Handlebars] Katz, Y., "Handlebars.js: Minimal Templating on Steroids",
  https://handlebarsjs.com/.
- [ISO8601] ISO, "Date and time — Representations for information
  interchange", ISO 8601.
- [ISO639-1] ISO, "Codes for the representation of names of languages —
  Part 1: Alpha-2 code", ISO 639-1.
- [RFC7946] Butler, H., Daly, M., Doyle, A., Gillies, S., Hagen, S.,
  and T. Schaub, "The GeoJSON Format", RFC 7946, August 2016.

## Appendix A. Schema.org Type Mapping

- PersonIdentity → `Person`
- PostalAddress → `PostalAddress`
- ContactPoint → `ContactPoint`
- SocialProfile → `resumejson:SocialProfile`
- Organization → `Organization`
- WorkExperience → `OrganizationRole`
- Education → `EducationalOccupationalCredential`
- Skill → `DefinedTerm`
- Certification → `EducationalOccupationalCredential`
- Project → `CreativeWork` (`resumejson:Project`)
- Volunteering → `OrganizationRole` (`VolunteerRole`)
- Award → `resumejson:Award`
- LanguageProficiency → `resumejson:LanguageProficiency`
- Publication → `ScholarlyArticle`
- StructuredResume → `CreativeWork` (`resumejson:StructuredResume`)

## Appendix B. Complete Example

See `examples/complete.resume.json` in the specification repository
for a document exercising every entity block type.

## Authors' Information

ResumeJSON is maintained at https://auth.careers/schema/.

The specification repository is available at
https://github.com/dancingskylab/resumejson.

License: BSD-3-Clause.
