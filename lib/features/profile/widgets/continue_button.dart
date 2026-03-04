import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/screen/home_screen.dart';
import '../provider/profile_provider.dart';
import '../service/profile_service.dart';

class ContinueButton extends ConsumerWidget {
  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(profileProvider);

    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
      onPressed: () async {

  if (state.fullName.trim().isEmpty) {
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Please enter your name")),
  );
  return;
}

  await ProfileService.saveProfile(
    fullName: state.fullName,
    language: state.language,
  );

  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Profile Saved")),
  );

  /// NAVIGATE TO PROFILE SCREEN
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const HomeScreen(),
    ),
  );
},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
           shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
        ),
        child: const Text("CONTINUE", 
        style: TextStyle(color: Colors.white),),
      ),
    );
  }
}