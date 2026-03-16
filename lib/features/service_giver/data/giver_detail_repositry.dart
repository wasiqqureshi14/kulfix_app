import 'package:kulfix/core/services/supabase_services.dart';

class ProviderDetailsRepository {

  Future<Map<String, dynamic>> fetchProviderDetails(String providerId) async {

    final provider = await supabase
        .from('service_providers')
        .select('''
id,
service_id,
full_name,
rating,
total_reviews,
profile_image,
price,
services(name),
companies(name)
''')
        .eq('id', providerId)
        .single();

    final reviews = await supabase
        .from('reviews')
        .select()
        .eq('provider_id', providerId)
        .order('created_at', ascending: false);

    final data = Map<String, dynamic>.from(provider);
    data['reviews'] = List<Map<String, dynamic>>.from(reviews);

    return data;
  }
}