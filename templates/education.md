{{!--
  /// Renders an education credential as an H3 section.
  ///
  /// Displays credential [name] as heading, [recognizedBy.name] in bold
  /// with optional location, followed by dates and optional field of
  /// study details ([about], [minor], [specialization]).
  ///
  /// Required: [name], [recognizedBy] (with [recognizedBy.name]).
  /// Optional: [startDate], [dateCreated], [expectedGraduation], [about],
  ///   [minor], [specialization], [gpa], [honors], [relevantCoursework],
  ///   [thesis], [activities].
--}}
### {{name}}

**{{recognizedBy.name}}**{{#recognizedBy.location}} · {{recognizedBy.location.address.addressLocality}}{{#recognizedBy.location.address.addressRegion}}, {{recognizedBy.location.address.addressRegion}}{{/recognizedBy.location.address.addressRegion}}{{/recognizedBy.location}}
{{#startDate}}{{startDate}} – {{/startDate}}{{#dateCreated}}{{dateCreated}}{{/dateCreated}}{{#expectedGraduation}} (Expected: {{expectedGraduation}}){{/expectedGraduation}}

{{#about}}**Major**: {{about}}{{/about}}{{#minor}} · **Minor**: {{minor}}{{/minor}}{{#specialization}} · **Specialization**: {{specialization}}{{/specialization}}

{{#gpa}}**GPA**: {{gpa}}{{/gpa}}{{#honors}} · {{honors}}{{/honors}}

{{#relevantCoursework}}
**Relevant Coursework**: {{#each relevantCoursework}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}
{{/relevantCoursework}}

{{#thesis}}**Thesis**: {{thesis}}{{/thesis}}

{{#activities}}
**Activities**: {{#each activities}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}
{{/activities}}
