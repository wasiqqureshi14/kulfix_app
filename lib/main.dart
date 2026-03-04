import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/core/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://uodgdbisvyecpldoppjq.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InVvZGdkYmlzdnllY3BsZG9wcGpxIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzE2NjYwNzcsImV4cCI6MjA4NzI0MjA3N30.n8Filx_k55NY4ZQW0DqMOp6-MpgqU0LLlwF2kZ9NcgY',
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KULFIX',
      debugShowCheckedModeBanner: false,

      home: const  AuthGate(),
    
    );
  }
}
