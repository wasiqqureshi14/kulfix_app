import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/profile/widgets/email_password_card.dart';
import '../provider/profile_provider.dart';

class NameInputCard extends ConsumerWidget {
  const NameInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
       padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xffF5F6F8),
        borderRadius: BorderRadius.circular(18),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("FULL NAME"),
            const SizedBox(height: 10),
            TextField(
              onChanged: (v) =>
                  ref.read(profileProvider.notifier).setName(v),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const EmailPasswordCard(),
          ],
        ),
      
    );
  }
}