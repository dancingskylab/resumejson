# ResumeJSON

**An open specification for structured resumes and CVs.**

ResumeJSON defines a **Schema.org-aligned JSON-LD vocabulary** and composable **Handlebars markdown templates** for representing professional resumes as structured, machine-readable data. Idiomatic **Dart type definitions** are planned for a future release.

| | |
|---|---|
| **Version** | 0.1.0 (Draft) |
| **License** | BSD-3-Clause |
| **Namespace** | `https://auth.careers/schema/` |
| **Prefix** | `resumejson:` |

---

## Why ResumeJSON?

Every career platform invents its own proprietary resume schema. Candidates reformat the same information dozens — sometimes hundreds — of times across job boards, applicant tracking systems, and recruiter portals. We believe the aggregate cost of this redundancy is staggering: collectively, job seekers and hiring platforms likely spend **millions of person-hours per year** re-entering, reformatting, and reconciling resume data. Each of those cycles may also carry a non-trivial computational footprint — parsing, re-rendering, and transmitting semantically identical information in incompatible formats consumes server time and, by extension, electricity.

While precise figures are difficult to establish, it is reasonable to hypothesize that adopting a **shared, structured resume interchange format** could yield **quantifiable savings** in both human effort and energy consumption. By defining a single, well-specified JSON schema grounded in an existing vocabulary, ResumeJSON aims to eliminate an entire class of busywork — write once, render anywhere.

ResumeJSON gives you an **open, vendor-neutral** alternative:

- **Schema.org first** – entity blocks (`Person`, `OrganizationRole`, `EducationalOccupationalCredential`, …) map directly to the world's most widely deployed structured-data vocabulary.
- **Composable rendering** – Handlebars markdown templates turn JSON into clean, readable output.
- **Platform agnostic** – a Dart type library (`package:resumejson`) is planned to run everywhere: Flutter, web, server, CLI, embedded.
- **Normalised data model** – a single `Organization` type is shared across work experience, education, certifications, volunteering, awards, and publications.

---

## Quick Start

### Document

```jsonc
// minimal.resume.json
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
  }
}
```

---

## Repository Layout

```
resumejson-spec/
├── SPECIFICATION.md      # Formal specification
├── CHANGELOG.md
├── CONTRIBUTING.md
├── LICENSE               # BSD-3-Clause
├── schema/               # JSON Schema definitions
│   ├── structured-resume.schema.json
│   ├── person-identity.schema.json
│   ├── work-experience.schema.json
│   └── ... (13 entity schemas)
├── templates/            # Handlebars markdown templates
│   ├── structured-resume.md
│   └── ... (partials per entity)
└── examples/
    ├── minimal.resume.json
    └── complete.resume.json
```

---

## Entity Blocks

| Entity | Schema.org Type | JSON Schema |
|--------|----------------|-------------|
| PersonIdentity | `Person` | `person-identity.schema.json` |
| PostalAddress | `PostalAddress` | `postal-address.schema.json` |
| ContactPoint | `ContactPoint` | `contact-point.schema.json` |
| SocialProfile | `resumejson:SocialProfile` | `social-profile.schema.json` |
| Organization | `Organization` | *(shared inline)* |
| WorkExperience | `OrganizationRole` | `work-experience.schema.json` |
| Education | `EducationalOccupationalCredential` | `education.schema.json` |
| Skill | `DefinedTerm` | `skill.schema.json` |
| Certification | `EducationalOccupationalCredential` | `certification.schema.json` |
| Project | `CreativeWork` | `project.schema.json` |
| Volunteering | `OrganizationRole` | `volunteering.schema.json` |
| Award | `resumejson:Award` | `award.schema.json` |
| LanguageProficiency | `resumejson:LanguageProficiency` | `language-proficiency.schema.json` |
| Publication | `ScholarlyArticle` | `publication.schema.json` |

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md).

---

## License

BSD-3-Clause. See [LICENSE](./LICENSE).
