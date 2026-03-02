{{!--
  /// Renders a language proficiency as a bullet list item.
  ///
  /// Displays [language] in bold with optional [languageCode] in
  /// parentheses, followed by [proficiency] level. Appends "Native"
  /// badge when [isNative] is true and lists any [certifications]
  /// as a comma-separated string.
  ///
  /// Required: [language], [proficiency].
  /// Optional: [languageCode], [isNative], [certifications].
--}}
- **{{language}}**{{#languageCode}} ({{languageCode}}){{/languageCode}} — {{proficiency}}{{#isNative}} · Native{{/isNative}}{{#certifications}} · {{#each certifications}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}{{/certifications}}
