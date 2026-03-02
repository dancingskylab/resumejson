{{!--
  /// Renders a publication as a bullet list item.
  ///
  /// Displays [headline] in bold, followed by optional [publisher.name],
  /// [datePublished], [publicationType], a clickable [url] link,
  /// [doi] identifier, and [coAuthors] comma-separated list.
  ///
  /// Required: [headline].
  /// Optional: [publisher] (with [publisher.name]), [datePublished],
  ///   [publicationType], [url], [doi], [coAuthors].
--}}
- **{{headline}}**{{#publisher}} — {{publisher.name}}{{/publisher}}{{#datePublished}} · {{datePublished}}{{/datePublished}}{{#publicationType}} · {{publicationType}}{{/publicationType}}{{#url}} · [Link]({{url}}){{/url}}{{#doi}} · DOI: {{doi}}{{/doi}}{{#coAuthors}} · Co-authors: {{#each coAuthors}}{{this}}{{#unless @last}}, {{/unless}}{{/each}}{{/coAuthors}}
