

import 'package:kulfix/core/services/supabase_services.dart';

class ProfileService {

  static Future<void> saveProfile({
    required String fullName,
    required String language,
  }) async {

    final user = supabase.auth.currentUser;

    await supabase.from('user_profiles').upsert({
      'id': user!.id,
      'full_name': fullName,
      'language': language,
    });
  }
}