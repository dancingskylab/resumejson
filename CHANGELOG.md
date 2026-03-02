# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] – 2026-03-01

### Added

- JSON-LD root document structure with Schema.org `@context` and `resumejson:` namespace (`https://auth.careers/schema/`)
- 13 entity block JSON schemas:
  - PersonIdentity, PostalAddress, ContactPoint, SocialProfile
  - WorkExperience, Education, Skill, Certification
  - Project, Volunteering, Award, LanguageProficiency, Publication
- Normalized **Organization** schema shared across WorkExperience, Education, Certification, Volunteering, Award, and Publication
- Root `structured-resume.schema.json` composing all entity schemas via `$ref`
- Handlebars markdown templates for each entity block plus root composition
- Example documents: `minimal.resume.json`, `complete.resume.json`
- Formal SPECIFICATION.md, CONTRIBUTING.md, LICENSE (BSD-3-Clause)
