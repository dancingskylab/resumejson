{{!--
  /// Renders a complete ResumeJSON document as markdown.
  ///
  /// Composes all entity block partials into a single document with
  /// horizontal rules between sections. Sections with no data are
  /// omitted automatically via Handlebars conditionals.
  ///
  /// Expects the root [StructuredResume] context object with optional
  /// top-level arrays: [workExperience], [education], [skills],
  /// [certifications], [projects], [volunteering], [awards],
  /// [languages], and [publications].
--}}
# {{about.name}}

{{#about.honorificPrefix}}{{about.honorificPrefix}} {{/about.honorificPrefix}}{{about.givenName}}{{#about.additionalName}} {{about.additionalName}}{{/about.additionalName}} {{about.familyName}}{{#about.honorificSuffix}}, {{about.honorificSuffix}}{{/about.honorificSuffix}}

{{#about.jobTitle}}**{{about.jobTitle}}**{{/about.jobTitle}}

{{#about.description}}
{{about.description}}
{{/about.description}}

---

{{#address}}
📍 {{#address.streetAddress}}{{address.streetAddress}}, {{/address.streetAddress}}{{address.addressLocality}}{{#address.addressRegion}}, {{address.addressRegion}}{{/address.addressRegion}}{{#address.postalCode}} {{address.postalCode}}{{/address.postalCode}}{{#address.addressCountry}}, {{address.addressCountry}}{{/address.addressCountry}}
{{/address}}

{{#contactPoints}}
**Contact**
{{#each contactPoints}}
{{> contact-point}}
{{/each}}
{{/contactPoints}}

{{#socialProfiles}}
**Profiles**
{{#each socialProfiles}}
{{> social-profile}}
{{/each}}
{{/socialProfiles}}

---

{{#workExperience}}
## Experience

{{#each workExperience}}
{{> work-experience}}

{{/each}}
{{/workExperience}}

---

{{#education}}
## Education

{{#each education}}
{{> education}}

{{/each}}
{{/education}}

---

{{#skills}}
## Skills

{{#each skills}}
{{> skill}}
{{/each}}
{{/skills}}

---

{{#certifications}}
## Certifications

{{#each certifications}}
{{> certification}}
{{/each}}
{{/certifications}}

---

{{#projects}}
## Projects

{{#each projects}}
{{> project}}

{{/each}}
{{/projects}}

---

{{#volunteering}}
## Volunteering

{{#each volunteering}}
{{> volunteering}}

{{/each}}
{{/volunteering}}

---

{{#awards}}
## Awards

{{#each awards}}
{{> award}}
{{/each}}
{{/awards}}

---

{{#languages}}
## Languages

{{#each languages}}
{{> language-proficiency}}
{{/each}}
{{/languages}}

---

{{#publications}}
## Publications

{{#each publications}}
{{> publication}}
{{/each}}
{{/publications}}


