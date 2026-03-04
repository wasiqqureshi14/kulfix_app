import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/email_login_provider.dart';

class EmailLoginFields extends ConsumerWidget {
  const EmailLoginFields({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(emailLoginProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text("EMAIL"),
        const SizedBox(height: 10),
        TextField(
          keyboardType: TextInputType.emailAddress,
          onChanged: (v) =>
              ref.read(emailLoginProvider.notifier)
                  .setEmail(v),
                   decoration: InputDecoration(
              hintText: "Enter your email",
              errorText: state.emailError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
        ),

        const SizedBox(height: 20),

        const Text("PASSWORD"),
        const SizedBox(height: 10),
        TextField(
          obscureText: true,
          onChanged: (v) =>
              ref.read(emailLoginProvider.notifier)
                  .setPassword(v),
                   decoration: InputDecoration(
              hintText: "Create password",
              errorText: state.passwordError,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
        ),
         if (state.serverError != null) ...[
          Text(
            state.serverError!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 13,
            ),
          ),
        ]
      ],
    );
  }
}