{{!--
  /// Renders a volunteering entry as an H3 section.
  ///
  /// Displays [roleName] as heading, [memberOf.name] in bold with
  /// optional [memberOf.cause]. Shows date range defaulting to
  /// "Present" when [endDate] is absent. Includes optional [description],
  /// [responsibilities], and [achievements] bullet lists.
  ///
  /// Required: [roleName], [memberOf] (with [memberOf.name]).
  /// Optional: [startDate], [endDate], [memberOf.cause], [description],
  ///   [responsibilities], [achievements].
--}}
### {{roleName}}

**{{memberOf.name}}**{{#memberOf.cause}} · {{memberOf.cause}}{{/memberOf.cause}}
{{#startDate}}{{startDate}}{{/startDate}}{{#endDate}} – {{endDate}}{{/endDate}}{{^endDate}}{{#startDate}} – Present{{/startDate}}{{/endDate}}

{{#description}}
{{description}}
{{/description}}

{{#responsibilities}}
{{#each responsibilities}}
- {{this}}
{{/each}}
{{/responsibilities}}

{{#achievements}}
{{#each achievements}}
- {{this}}
{{/each}}
{{/achievements}}
