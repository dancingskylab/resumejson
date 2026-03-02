{{!--
  /// Renders a work experience entry as an H3 section.
  ///
  /// Displays [roleName] as heading, [memberOf.name] in bold with
  /// optional location, and a date range from [startDate] to [endDate]
  /// (defaulting to "Present"). Includes optional [description],
  /// [responsibilities], and [achievements] lists, plus a [keywords]
  /// comma-separated line for technologies.
  ///
  /// Required: [roleName], [startDate], [memberOf] (with [memberOf.name]).
  /// Optional: [endDate], [employmentType], [workLocationType],
  ///   [description], [responsibilities], [achievements], [keywords].
--}}
### {{roleName}}

**{{memberOf.name}}**{{#memberOf.location}} · {{memberOf.location.address.addressLocality}}{{#memberOf.location.address.addressRegion}}, {{memberOf.location.address.addressRegion}}{{/memberOf.location.address.addressRegion}}{{/memberOf.location}}
{{startDate}} – {{#endDate}}{{endDate}}{{/endDate}}{{^endDate}}Present{{/endDate}}{{#employmentType}} · {{employmentType}}{{/employmentType}}{{#workLocationType}} · {{workLocationType}}{{/workLocationType}}

{{#description}}
{{description}}

{{/description}}
{{#responsibilities}}
**Responsibilities**
{{#each responsibilities}}
- {{this}}
{{/each}}

{{/responsibilities}}
{{#achievements}}
**Achievements**
{{#each achievements}}
- {{this}}
{{/each}}

{{/achievements}}
{{#keywords}}
**Technologies**: {{#each keywords}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}
{{/keywords}}
