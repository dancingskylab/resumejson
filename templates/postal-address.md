{{!--
  /// Renders a postal address as a single inline line with a 📍 prefix.
  ///
  /// Concatenates address components in the order: [streetAddress],
  /// [addressLocality], [addressRegion], [postalCode], [addressCountry].
  /// Components are comma-separated and omitted when absent.
  ///
  /// Required: [addressLocality].
  /// Optional: [streetAddress], [addressRegion], [postalCode],
  ///   [addressCountry].
--}}
📍 {{#streetAddress}}{{streetAddress}}, {{/streetAddress}}{{addressLocality}}{{#addressRegion}}, {{addressRegion}}{{/addressRegion}}{{#postalCode}} {{postalCode}}{{/postalCode}}{{#addressCountry}}, {{addressCountry}}{{/addressCountry}}
