import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileState {
  final String fullName;
  final String language;
  final String? imagePath;

  /// NEW FIELDS
  final String email;
  final String password;
  final String confirmPassword;

  /// UI STATES
  final bool isSaving;
  final String? errorMessage;

  const ProfileState({
    this.fullName = '',
    this.language = 'en',
    this.imagePath,
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.isSaving = false,
    this.errorMessage,
  });

  /// VALIDATIONS
  bool get isNameValid => fullName.trim().isNotEmpty;

  bool get isEmailValid =>
      email.contains('@') && email.contains('.');

  bool get isPasswordValid => password.length >= 6;

  bool get doPasswordsMatch =>
      password == confirmPassword;

  bool get isFormValid =>
      isNameValid &&
      isEmailValid &&
      isPasswordValid &&
      doPasswordsMatch;

  ProfileState copyWith({
    String? fullName,
    String? language,
    String? imagePath,
    String? email,
    String? password,
    String? confirmPassword,
    bool? isSaving,
    String? errorMessage,
  }) {
    return ProfileState(
      fullName: fullName ?? this.fullName,
      language: language ?? this.language,
      imagePath: imagePath ?? this.imagePath,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword:
          confirmPassword ?? this.confirmPassword,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: errorMessage,
    );
  }
}

class ProfileNotifier extends Notifier<ProfileState> {
  @override
  ProfileState build() => const ProfileState();

  void setName(String name) {
    state = state.copyWith(fullName: name);
  }

  void setLanguage(String lang) {
    state = state.copyWith(language: lang);
  }

  void setImage(String path) {
    state = state.copyWith(imagePath: path);
  }

  void setEmail(String value) {
  state = state.copyWith(email: value);
}

void setPassword(String value) {
  state = state.copyWith(password: value);
}

void setConfirmPassword(String value) {
  state = state.copyWith(confirmPassword: value);
}

void setSaving(bool value) {
  state = state.copyWith(isSaving: value);
}

void setError(String? message) {
  state = state.copyWith(errorMessage: message);
}
}

final profileProvider =
    NotifierProvider<ProfileNotifier, ProfileState>(
        ProfileNotifier.new);