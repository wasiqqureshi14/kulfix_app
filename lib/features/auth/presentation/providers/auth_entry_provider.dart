import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthEntryType {
  phone,
  email,
}

class AuthEntryNotifier extends Notifier<AuthEntryType?> {

  @override
  AuthEntryType? build() => null;

  void choosePhone() {
    state = AuthEntryType.phone;
  }

  void chooseEmail() {
    state = AuthEntryType.email;
  }

  void reset() {
    state = null;
  }
}

final authEntryProvider =
    NotifierProvider<AuthEntryNotifier, AuthEntryType?>(
        AuthEntryNotifier.new);