import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/core/services/supabase_services.dart';

final userNameProvider = FutureProvider<String>((ref) async {

  final user = supabase.auth.currentUser;

  if (user == null) {
    return "User";
  }

  final response = await supabase
      .from('user_profiles')
      .select('full_name')
      .eq('id', user.id)
      .single();

  return response['full_name'] ?? "User";
});