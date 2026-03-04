import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class OTPState {
  final List<String> digits;
  final int seconds;
  final bool isResending;

  const OTPState({
    this.digits = const ['', '', '', '', '', ''],
    this.seconds = 60,
    this.isResending = false,
  });

  bool get isComplete => digits.every((e) => e.isNotEmpty);

  String get code => digits.join();

  String get formattedTime {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return "$minutes:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  bool get canResend => seconds == 0 && !isResending;

  OTPState copyWith({
    List<String>? digits,
    int? seconds,
    bool? isResending,
  }) {
    return OTPState(
      digits: digits ?? this.digits,
      seconds: seconds ?? this.seconds,
      isResending: isResending ?? this.isResending,
    );
  }
}


final otpProvider =
    NotifierProvider<OTPNotifier, OTPState>(OTPNotifier.new);


class OTPNotifier extends Notifier<OTPState> {
  Timer? _timer;

  @override
  OTPState build() {
    return const OTPState();
  }

  /// Update OTP digit
  void updateDigit(int index, String value) {
    final updated = [...state.digits];
    updated[index] = value;
    state = state.copyWith(digits: updated);
  }

  /// Start countdown timer
  void startTimer() {
    _timer?.cancel();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.seconds <= 0) {
          timer.cancel();
        } else {
          state = state.copyWith(seconds: state.seconds - 1);
        }
      },
    );
  }

  /// Verify OTP
  Future<bool> verifyOTP(String phone) async {
    try {
      await Supabase.instance.client.auth.verifyOTP(
        phone: phone,
        token: state.code,
        type: OtpType.sms,
      );
      return true;
    } catch (_) {
      return false;
    }
  }

Future<void> resendOTP(String phone) async {

  if (state.isResending) return;

  state = state.copyWith(isResending: true);

  try {
    await Supabase.instance.client.auth.signInWithOtp(
      phone: phone,
    );

    state = state.copyWith(
      seconds: 60,
      isResending: false,
    );

    startTimer();

  } catch (_) {
    state = state.copyWith(isResending: false);
  }
}

  /// ✅ Manual cleanup (called from screen)
  void stopTimer() {
    _timer?.cancel();
  }
}