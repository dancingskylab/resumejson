{{!--
  /// Renders a skill as a bullet list item.
  ///
  /// Displays [name] in bold with [termCode] in parentheses, followed
  /// by optional [proficiencyLevel] and [yearsOfExperience] separated
  /// by middot delimiters.
  ///
  /// Required: [name], [termCode].
  /// Optional: [proficiencyLevel], [yearsOfExperience].
--}}
- **{{name}}** ({{termCode}}){{#proficiencyLevel}} · {{proficiencyLevel}}{{/proficiencyLevel}}{{#yearsOfExperience}} · {{yearsOfExperience}} yrs{{/yearsOfExperience}}
