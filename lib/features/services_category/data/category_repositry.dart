import 'package:kulfix/core/services/supabase_services.dart';
import 'package:kulfix/features/services_category/models/service_giver_filter.dart';

class CategoryRepository {

  Future<List<Map<String, dynamic>>> fetchProviders({
  required String serviceId,
  required ProviderFilter filter,
  required DateTime date,
  required String startTime,
  required String endTime,

  
}) async {
  

  final result = await supabase.rpc(
    'get_available_providers',
    params: {
      'p_service_id': serviceId,
      'p_date': date.toIso8601String().split('T').first,
      'p_start_time': startTime,
      'p_end_time': endTime,
    },
  );

  List<Map<String,dynamic>> providers =
      List<Map<String,dynamic>>.from(result);

  switch(filter) {

    case ProviderFilter.highestRated:
      providers.sort((a,b) =>
        (b['rating'] ?? 0).compareTo(a['rating'] ?? 0));
      break;

    case ProviderFilter.lowestRated:
      providers.sort((a,b) =>
        (a['rating'] ?? 0).compareTo(b['rating'] ?? 0));
      break;

    case ProviderFilter.mostReviewed:
      providers.sort((a,b) =>
        (b['total_reviews'] ?? 0)
        .compareTo(a['total_reviews'] ?? 0));
      break;

    case ProviderFilter.all:
      break;
  }

  return providers;
}
}