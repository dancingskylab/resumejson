{{!--
  /// Renders a certification as a bullet list item.
  ///
  /// Displays [name] in bold, followed by [recognizedBy.name] as the
  /// issuing organization. Appends optional [validFrom], [validThrough],
  /// [credentialId], and a clickable [verificationUrl] link.
  ///
  /// Required: [name], [recognizedBy] (with [recognizedBy.name]).
  /// Optional: [validFrom], [validThrough], [credentialId],
  ///   [verificationUrl].
--}}
- **{{name}}** — {{recognizedBy.name}}{{#validFrom}} · Earned {{validFrom}}{{/validFrom}}{{#validThrough}} · Expires {{validThrough}}{{/validThrough}}{{#credentialId}} · ID: {{credentialId}}{{/credentialId}}{{#verificationUrl}} · [Verify]({{verificationUrl}}){{/verificationUrl}}
