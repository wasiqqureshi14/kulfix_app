import 'package:kulfix/core/services/supabase_services.dart';

class ProviderDetailsRepository {

  Future<Map<String, dynamic>> fetchProviderDetails(String providerId) async {

    final response = await supabase
        .from('service_providers')
        .select('''
        id,
        full_name,
        rating,
        total_reviews,
        profile_image,
        provider_professions(
          price,
          professions(name)
        )
        ''')
        .eq('id', providerId)
        .single();

    return Map<String, dynamic>.from(response);
  }

  Future<List<Map<String, dynamic>>> fetchReviews(String providerId) async {

    final response = await supabase
        .from('reviews')
        .select()
        .eq('provider_id', providerId)
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response);
  }
}