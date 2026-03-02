// Enum definitions for all constrained string fields in the ResumeJSON
// specification.

// Contact type (§3.3).

/// The type of contact method.
enum ContactType {
  /// Electronic mail.
  email('email'),

  /// Telephone.
  phone('phone'),

  /// Fax machine.
  fax('fax'),

  /// Website URL.
  website('website');

  const ContactType(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [ContactType].
  static ContactType fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown ContactType value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Social platform (§3.4).

/// A social media or professional platform identifier.
enum SocialPlatform {
  /// LinkedIn.
  linkedin('linkedin'),

  /// GitHub.
  github('github'),

  /// Twitter / X.
  twitter('twitter'),

  /// Portfolio website.
  portfolio('portfolio'),

  /// Stack Overflow.
  stackoverflow('stackoverflow'),

  /// Dribbble.
  dribbble('dribbble'),

  /// Behance.
  behance('behance'),

  /// Medium.
  medium('medium'),

  /// YouTube.
  youtube('youtube'),

  /// Kaggle.
  kaggle('kaggle'),

  /// DEV Community.
  devto('devto'),

  /// Personal website.
  personalWebsite('personal_website'),

  /// Other platform.
  other('other');

  const SocialPlatform(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [SocialPlatform].
  static SocialPlatform fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown SocialPlatform value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Employment type (§3.6).

/// The type of employment for a work experience entry.
enum EmploymentType {
  /// Full-time employment.
  fullTime('FULL_TIME'),

  /// Part-time employment.
  partTime('PART_TIME'),

  /// Contract engagement.
  contract('CONTRACT'),

  /// Internship.
  internship('INTERNSHIP'),

  /// Freelance work.
  freelance('FREELANCE'),

  /// Temporary position.
  temporary('TEMPORARY'),

  /// Apprenticeship.
  apprenticeship('APPRENTICESHIP'),

  /// Seasonal employment.
  seasonal('SEASONAL');

  const EmploymentType(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into an [EmploymentType].
  static EmploymentType fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown EmploymentType value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Work location type (§3.6).

/// The work location arrangement.
enum WorkLocationType {
  /// Fully remote.
  remote('remote'),

  /// Hybrid (remote and on-site).
  hybrid('hybrid'),

  /// On-site / in-office.
  office('office'),

  /// Not specified.
  unspecified('unspecified');

  const WorkLocationType(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [WorkLocationType].
  static WorkLocationType fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown WorkLocationType value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Credential category (§3.7 / §3.9).

/// The category of an educational or professional credential.
enum CredentialCategory {
  /// Bachelor's degree.
  bachelor('bachelor'),

  /// Master's degree.
  master('master'),

  /// Doctoral degree.
  doctorate('doctorate'),

  /// Associate degree.
  associate('associate'),

  /// Diploma.
  diploma('diploma'),

  /// Certificate.
  certificate('certificate'),

  /// High school diploma or equivalent.
  highSchool('high_school'),

  /// Coding bootcamp or intensive program.
  bootcamp('bootcamp'),

  /// Professional degree (e.g., JD, MD).
  professionalDegree('professional_degree'),

  /// Postdoctoral research.
  postdoctoral('postdoctoral'),

  /// Professional certification.
  certification('certification'),

  /// Other credential type.
  other('other');

  const CredentialCategory(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [CredentialCategory].
  static CredentialCategory fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown CredentialCategory value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Skill category (§3.8).

/// The category (`termCode`) for a skill entry.
enum SkillCategory {
  /// Technical skill.
  technical('technical'),

  /// Soft / interpersonal skill.
  soft('soft'),

  /// Language skill.
  language('language'),

  /// Tool proficiency.
  tool('tool'),

  /// Framework proficiency.
  framework('framework'),

  /// Methodology.
  methodology('methodology'),

  /// Domain expertise.
  domain('domain'),

  /// Platform expertise.
  platform('platform'),

  /// Database technology.
  database('database'),

  /// Cloud platform.
  cloud('cloud'),

  /// Other skill category.
  other('other');

  const SkillCategory(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [SkillCategory].
  static SkillCategory fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown SkillCategory value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Proficiency level (§3.8).

/// A skill proficiency level.
enum ProficiencyLevel {
  /// Beginner.
  beginner('beginner'),

  /// Intermediate.
  intermediate('intermediate'),

  /// Advanced.
  advanced('advanced'),

  /// Expert.
  expert('expert');

  const ProficiencyLevel(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [ProficiencyLevel].
  static ProficiencyLevel fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown ProficiencyLevel value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Language proficiency level (§3.13).

/// A spoken or written language proficiency level.
enum LanguageProficiencyLevel {
  /// Native speaker.
  native('native'),

  /// Fluent.
  fluent('fluent'),

  /// Professional working proficiency.
  professional('professional'),

  /// Intermediate.
  intermediate('intermediate'),

  /// Basic.
  basic('basic');

  const LanguageProficiencyLevel(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [LanguageProficiencyLevel].
  static LanguageProficiencyLevel fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown LanguageProficiencyLevel value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Project type (§3.10).

/// The type of project.
enum ProjectType {
  /// Personal project.
  personal('personal'),

  /// Academic project.
  academic('academic'),

  /// Open-source project.
  openSource('open_source'),

  /// Freelance project.
  freelance('freelance'),

  /// Hackathon project.
  hackathon('hackathon'),

  /// Research project.
  research('research'),

  /// Other project type.
  other('other');

  const ProjectType(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [ProjectType].
  static ProjectType fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown ProjectType value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}

// Publication type (§3.14).

/// The type of publication.
enum PublicationType {
  /// Journal article.
  journalArticle('journal_article'),

  /// Conference paper.
  conferencePaper('conference_paper'),

  /// Book chapter.
  bookChapter('book_chapter'),

  /// Whitepaper.
  whitepaper('whitepaper'),

  /// Blog post.
  blogPost('blog_post'),

  /// Patent.
  patent('patent'),

  /// Thesis or dissertation.
  thesis('thesis'),

  /// Conference talk or presentation.
  talk('talk'),

  /// Poster.
  poster('poster'),

  /// Other publication type.
  other('other');

  const PublicationType(this.jsonValue);

  /// The JSON string value as defined in the specification.
  final String jsonValue;

  /// Deserializes a JSON string into a [PublicationType].
  static PublicationType fromJson(String json) => values.firstWhere(
    (e) => e.jsonValue == json,
    orElse: () => throw FormatException(
      'Unknown PublicationType value "$json". '
      'Valid values: ${values.map((e) => e.jsonValue).join(', ')}.',
    ),
  );
}
