import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:kulfix/features/home/screen/home_screen.dart';
import 'package:kulfix/features/auth/presentation/screens/selection_screen/choice_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {

    final session =
        Supabase.instance.client.auth.currentSession;

    if (session != null) {
      return const HomeScreen();
    }

    return const AuthChoiceScreen();
  }
}