import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/auth/presentation/providers/auth_entry_provider.dart';
import 'package:kulfix/features/auth/presentation/screens/email_login/email_login.dart';
import 'package:kulfix/features/auth/presentation/screens/phone_login/phone_login.dart';

class AuthChoiceScreen extends ConsumerWidget {
  const AuthChoiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    /// Listen ONLY for navigation changes
    ref.listen<AuthEntryType?>(
      authEntryProvider,
      (previous, next) {

        if (next == AuthEntryType.phone) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const PhoneLoginScreen(),
            ),
          );
        }

        if (next == AuthEntryType.email) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const EmailLoginScreen(),
            ),
          );
        }
      },
    );

    /// PURE UI (instant render)
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [

              const Spacer(),

              const Text(
                "Welcome to KULFIX",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Choose how you want to continue",
                style: TextStyle(
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 60),

              /// PHONE BUTTON
              _authButton(
                text: "Continue with Phone",
                onTap: () => ref
                    .read(authEntryProvider.notifier)
                    .choosePhone(),
              ),

              const SizedBox(height: 18),

              /// EMAIL BUTTON
              _authButton(
                text: "Sign in with Email",
                isOutlined: true,
                onTap: () => ref
                    .read(authEntryProvider.notifier)
                    .chooseEmail(),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _authButton({
    required String text,
    required VoidCallback onTap,
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor:
              isOutlined ? Colors.white : Colors.black,
          side: isOutlined
              ? const BorderSide(color: Colors.black)
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                isOutlined ? Colors.black : Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}