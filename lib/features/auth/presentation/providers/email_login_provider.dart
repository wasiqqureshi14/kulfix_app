import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EmailLoginState {
  final String email;
  final String password;
  final bool isLoading;
  final String? emailError;
  final String? passwordError;
  final String? serverError;
  final bool loginSuccess;

  const EmailLoginState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.emailError,
    this.passwordError,
    this.serverError,
    this.loginSuccess = false,
  });

  EmailLoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    String? emailError,
    String? passwordError,
    String? serverError,
    bool? loginSuccess,
  }) {
    return EmailLoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      emailError: emailError,
      passwordError: passwordError,
      serverError: serverError,
      loginSuccess: loginSuccess ?? false,
    );
  }
}

class EmailLoginNotifier extends Notifier<EmailLoginState> {

  final _supabase = Supabase.instance.client;
  

  @override
  EmailLoginState build() => const EmailLoginState();

  void setEmail(String value) {
    state = state.copyWith(email: value, emailError: null);
  }

  void setPassword(String value) {
    state = state.copyWith(password: value, passwordError: null);
  }

 Future<void> login() async {

  String? emailError;
  String? passwordError;

  if (!state.email.contains('@')) {
    emailError = "Enter valid email";
  }

  if (state.password.length < 6) {
    passwordError = "Minimum 6 characters";
  }

  if (emailError != null || passwordError != null) {
    state = state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    );
    return;
  }

  state = state.copyWith(
    isLoading: true,
    emailError: null,
    passwordError: null,
    serverError: null,
  );

  try {
    await _supabase.auth.signInWithPassword(
      email: state.email.trim(),
      password: state.password.trim(),
    );

    state = state.copyWith(
      isLoading: false,
      loginSuccess: true,
    );

  } on AuthException catch (e) {
    state = state.copyWith(
      isLoading: false,
      serverError: e.message,
    );
  }
}
}

final emailLoginProvider =
    NotifierProvider<EmailLoginNotifier, EmailLoginState>(
        EmailLoginNotifier.new);