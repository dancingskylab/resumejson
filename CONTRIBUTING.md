# Contributing to ResumeJSON

Thank you for your interest in contributing to the ResumeJSON specification. This document outlines how to propose changes and the process for getting them accepted.

## How to Contribute

### Reporting Issues

- Use GitHub Issues to report bugs, ambiguities, or request enhancements.
- Tag issues with `spec`, `schema`, or `template` as appropriate.

### Proposing Schema Changes

Schema changes that add, remove, or modify entity block properties follow a lightweight RFC process:

1. **Open an Issue** describing the problem or gap.
2. **Draft an RFC** as a pull request modifying `SPECIFICATION.md` and the relevant `.schema.json` files.
3. **Discussion period**: RFCs are open for discussion for at least 14 days.
4. **Consensus**: Changes are accepted when there is rough consensus among maintainers.

### Pull Request Conventions

- One logical change per PR.
- Update `SPECIFICATION.md`, the relevant `schema/*.schema.json`, and `templates/*.md` files together.
- Add or update examples in `examples/` if the change affects document structure.
- Update `CHANGELOG.md` under an `[Unreleased]` section.

### Version Bumping

- **Patch** (0.1.x): Typo fixes, clarifications that don't change semantics.
- **Minor** (0.x.0): New optional properties, new entity blocks, new template partials.
- **Major** (x.0.0): Removing properties, changing required fields, renaming types, breaking serialization.

## Code of Conduct

Be respectful, constructive, and inclusive. We follow the [Contributor Covenant](https://www.contributor-covenant.org/version/2/1/code_of_conduct/).

## License

By contributing, you agree that your contributions will be licensed under the BSD-3-Clause License.
