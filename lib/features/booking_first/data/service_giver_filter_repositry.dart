import 'package:kulfix/core/services/supabase_services.dart';

class ProviderFilterRepository {

  

  Future<List<Map<String,dynamic>>> getFilteredProviders({
    required String serviceId,
    required DateTime date,
    required String startTime,
    required String endTime,
  }) async {
    if (serviceId.isEmpty) {
  throw Exception("Service ID is empty");
}

    final result = await supabase.rpc(
      'get_available_providers',
      params: {
        'p_service_id': serviceId,
        'p_date': date.toIso8601String().split('T').first,
        'p_start_time': startTime,
        'p_end_time': endTime,
      },
    );
print("SERVICE ID: $serviceId");
print("DATE: $date");
print("START: $startTime");
print("END: $endTime");

   return (result as List)
    .map((e) => Map<String,dynamic>.from(e))
    .toList();
  }
}