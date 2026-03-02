{{!--
  /// Renders a project as an H3 section.
  ///
  /// Displays [name] as heading with optional [url] link, [projectType],
  /// and [role]. Shows date range when [startDate] and [endDate] are
  /// present. Includes optional [description] body text and a [keywords]
  /// comma-separated line for technologies.
  ///
  /// Required: [name].
  /// Optional: [url], [projectType], [role], [startDate], [endDate],
  ///   [description], [keywords].
--}}
### {{name}}

{{#url}}[{{url}}]({{url}}){{/url}}{{#projectType}} · {{projectType}}{{/projectType}}{{#role}} · {{role}}{{/role}}
{{#startDate}}{{startDate}}{{/startDate}}{{#endDate}} – {{endDate}}{{/endDate}}

{{#description}}
{{description}}
{{/description}}

{{#keywords}}
**Technologies**: {{#each keywords}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}
{{/keywords}}
