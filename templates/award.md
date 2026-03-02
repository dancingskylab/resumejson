{{!--
  /// Renders an award as a bullet list item.
  ///
  /// Displays [name] in bold, followed by the optional [awardedBy.name]
  /// organization, [dateAwarded], and [description] separated by
  /// em-dash and middot delimiters.
  ///
  /// Required: [name].
  /// Optional: [awardedBy] (with [awardedBy.name]), [dateAwarded],
  ///   [description].
--}}
- **{{name}}**{{#awardedBy}} — {{awardedBy.name}}{{/awardedBy}}{{#dateAwarded}} · {{dateAwarded}}{{/dateAwarded}}{{#description}} — {{description}}{{/description}}
