import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/profile_provider.dart';

class EmailPasswordCard extends ConsumerWidget {
  const EmailPasswordCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileProvider);

    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// EMAIL
          const Text("EMAIL"),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.emailAddress,
            onChanged: (v) =>
                ref.read(profileProvider.notifier).setEmail(v),
            decoration: InputDecoration(
              hintText: "Enter your email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorText: state.email.isEmpty || state.isEmailValid
                  ? null
                  : "Enter valid email",
            ),
          ),

          const SizedBox(height: 18),

          /// PASSWORD
          const Text("PASSWORD"),
          const SizedBox(height: 10),
          TextField(
            obscureText: true,
            onChanged: (v) =>
                ref.read(profileProvider.notifier).setPassword(v),
            decoration: InputDecoration(
              hintText: "Create password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorText: state.password.isEmpty ||
                      state.isPasswordValid
                  ? null
                  : "Minimum 6 characters",
            ),
          ),

          const SizedBox(height: 18),

          /// CONFIRM PASSWORD
          const Text("CONFIRM PASSWORD"),
          const SizedBox(height: 10),
          TextField(
            obscureText: true,
            onChanged: (v) => ref
                .read(profileProvider.notifier)
                .setConfirmPassword(v),
            decoration: InputDecoration(
              hintText: "Re-enter password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              errorText: state.confirmPassword.isEmpty ||
                      state.doPasswordsMatch
                  ? null
                  : "Passwords do not match",
            ),
          ),
        ],
      
    );
  }
}