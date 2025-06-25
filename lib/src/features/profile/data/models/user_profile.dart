class UserProfile {
  const UserProfile({
    required this.id,
    required this.email,
    required this.name,
    this.surname,
    this.heightCm,
    this.weightKg,
    this.dateOfBirth,
    this.gender,
    this.sportingLevel,
    this.sportPreferences = const [],
    this.preferredUnitSystem = 'metric',
    this.uiTheme = 'system',
    this.preferredLanguage = 'it',
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String email;
  final String name;
  final String? surname;
  final int? heightCm;
  final double? weightKg;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? sportingLevel;
  final List<String> sportPreferences;
  final String preferredUnitSystem;
  final String uiTheme;
  final String preferredLanguage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String?,
      heightCm: json['height_cm'] as int?,
      weightKg: (json['weight_kg'] as num?)?.toDouble(),
      dateOfBirth: json['date_of_birth'] != null
          ? DateTime.parse(json['date_of_birth'] as String)
          : null,
      gender: json['gender'] as String?,
      sportingLevel: json['sporting_level'] as String?,
      sportPreferences:
          (json['sport_preferences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      preferredUnitSystem: json['preferred_unit_system'] as String? ?? 'metric',
      uiTheme: json['ui_theme'] as String? ?? 'system',
      preferredLanguage: json['preferred_language'] as String? ?? 'it',
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'surname': surname,
      'height_cm': heightCm,
      'weight_kg': weightKg,
      'date_of_birth': dateOfBirth?.toIso8601String().split('T')[0],
      'gender': gender,
      'sporting_level': sportingLevel,
      'sport_preferences': sportPreferences,
      'preferred_unit_system': preferredUnitSystem,
      'ui_theme': uiTheme,
      'preferred_language': preferredLanguage,
    };
  }

  UserProfile copyWith({
    String? id,
    String? email,
    String? name,
    String? surname,
    int? heightCm,
    double? weightKg,
    DateTime? dateOfBirth,
    String? gender,
    String? sportingLevel,
    List<String>? sportPreferences,
    String? preferredUnitSystem,
    String? uiTheme,
    String? preferredLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return UserProfile(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      sportingLevel: sportingLevel ?? this.sportingLevel,
      sportPreferences: sportPreferences ?? this.sportPreferences,
      preferredUnitSystem: preferredUnitSystem ?? this.preferredUnitSystem,
      uiTheme: uiTheme ?? this.uiTheme,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  /// Verifica se il profilo è completo
  bool get isComplete {
    return name.isNotEmpty &&
        heightCm != null &&
        weightKg != null &&
        dateOfBirth != null &&
        gender != null &&
        sportingLevel != null &&
        sportPreferences.isNotEmpty;
  }

  /// Calcola l'età dell'utente
  int? get age {
    if (dateOfBirth == null) return null;
    final now = DateTime.now();
    int age = now.year - dateOfBirth!.year;
    if (now.month < dateOfBirth!.month ||
        (now.month == dateOfBirth!.month && now.day < dateOfBirth!.day)) {
      age--;
    }
    return age;
  }

  /// Verifica se uno sport è tra le preferenze
  bool hasSportPreference(String sport) {
    return sportPreferences.contains(sport);
  }

  @override
  String toString() {
    return 'UserProfile(id: $id, email: $email, name: $name, isComplete: $isComplete)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserProfile &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.surname == surname &&
        other.heightCm == heightCm &&
        other.weightKg == weightKg &&
        other.dateOfBirth == dateOfBirth &&
        other.gender == gender &&
        other.sportingLevel == sportingLevel &&
        other.sportPreferences.toString() == sportPreferences.toString() &&
        other.preferredUnitSystem == preferredUnitSystem &&
        other.uiTheme == uiTheme &&
        other.preferredLanguage == preferredLanguage;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      email,
      name,
      surname,
      heightCm,
      weightKg,
      dateOfBirth,
      gender,
      sportingLevel,
      sportPreferences,
      preferredUnitSystem,
      uiTheme,
      preferredLanguage,
    );
  }
}
