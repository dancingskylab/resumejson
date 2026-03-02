{{!--
  /// Renders a social profile as a bullet list item with a markdown link.
  ///
  /// Uses [displayText] as the link label when available, falling back
  /// to [platform] if not provided.
  ///
  /// Required: [url], [platform].
  /// Optional: [displayText].
--}}
- [{{#displayText}}{{displayText}}{{/displayText}}{{^displayText}}{{platform}}{{/displayText}}]({{url}})
