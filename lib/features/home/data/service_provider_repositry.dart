import 'package:kulfix/core/services/supabase_services.dart';

class ProvidersRepository {

  /// fetch providers sorted by rating
  Future<List<Map<String, dynamic>>> fetchTopRated({
    required int limit,
    required int offset,
  }) async {
final response = await supabase
    .from('service_providers')
   .select('''
id,
service_id,
full_name,
profile_image,
rating,
total_reviews,
price,
companies!service_providers_company_id_fkey(
  name
)
''')
.order('rating', ascending: false)
.range(offset, offset + limit - 1);

print(response);
    return List<Map<String, dynamic>>.from(response);
  }
}