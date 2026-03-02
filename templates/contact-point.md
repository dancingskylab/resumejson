{{!--
  /// Renders a single contact point as a bullet list item.
  ///
  /// Displays the appropriate icon (📧, 📞, 📠, 🌐) based on which
  /// channel field is present. Appends the optional [label] in
  /// parentheses for disambiguation. The [url] variant renders as a
  /// clickable markdown link.
  ///
  /// At least one of: [email], [telephone], [faxNumber], [url].
  /// Optional: [label].
--}}
{{#if email}}- 📧 {{email}}{{#label}} ({{label}}){{/label}}{{/if}}
{{#if telephone}}- 📞 {{telephone}}{{#label}} ({{label}}){{/label}}{{/if}}
{{#if faxNumber}}- 📠 {{faxNumber}}{{#label}} ({{label}}){{/label}}{{/if}}
{{#if url}}- 🌐 [{{#label}}{{label}}{{/label}}{{^label}}{{url}}{{/label}}]({{url}}){{/if}}
