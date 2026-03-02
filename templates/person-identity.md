{{!--
  /// Renders a person's identity as a markdown header block.
  ///
  /// Displays the full [name] as an H1, followed by the formatted
  /// name components with optional [honorificPrefix] and
  /// [honorificSuffix]. Shows [jobTitle] in bold and [description]
  /// as body text when present.
  ///
  /// Required: [givenName], [familyName], [name].
  /// Optional: [honorificPrefix], [honorificSuffix], [additionalName],
  ///   [jobTitle], [description].
--}}
# {{name}}

{{#honorificPrefix}}{{honorificPrefix}} {{/honorificPrefix}}{{givenName}}{{#additionalName}} {{additionalName}}{{/additionalName}} {{familyName}}{{#honorificSuffix}}, {{honorificSuffix}}{{/honorificSuffix}}

{{#jobTitle}}**{{jobTitle}}**{{/jobTitle}}

{{#description}}
{{description}}
{{/description}}
