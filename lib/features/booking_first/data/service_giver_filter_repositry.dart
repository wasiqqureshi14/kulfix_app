import 'package:kulfix/core/services/supabase_services.dart';

class ProviderFilterRepository {

 Future<List<Map<String,dynamic>>> getFilteredProviders({
  required String serviceId,
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

  return List<Map<String,dynamic>>.from(result);
}
}