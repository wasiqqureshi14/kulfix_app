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
full_name,
rating,
total_reviews,
price,
services(name),
companies(name)
''')
.order('rating', ascending: false)
.range(offset, offset + limit - 1);


    return List<Map<String, dynamic>>.from(response);
  }
}