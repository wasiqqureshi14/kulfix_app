import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/auth/presentation/providers/email_login_provider.dart';
import 'package:kulfix/features/auth/presentation/widgets/email_login_field.dart';
import 'package:kulfix/features/home/screen/home_screen.dart';

class EmailLoginScreen extends ConsumerWidget {
  const EmailLoginScreen({super.key});

  @override
Widget build(BuildContext context, WidgetRef ref) {

  final isLoading = ref.watch(
    emailLoginProvider.select((s) => s.isLoading),
  );

  ref.listen(emailLoginProvider, (previous, next) {

   if (next.serverError != null) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(next.serverError!)),
  );
}

    if (next.loginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        ),
      );

      // Reset state after navigation
      ref.read(emailLoginProvider.notifier) .state = const EmailLoginState();
    }
  });

  return Scaffold(
    backgroundColor: Colors.white,
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [

            /// HEADER
            Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            const EmailLoginFields(),

            const SizedBox(height: 30),

            /// BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () {
                        ref
                            .read(emailLoginProvider.notifier)
                            .login();
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  disabledBackgroundColor: Colors.black,
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(14),
                  ),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.8,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}