import 'package:kulfix/core/services/supabase_services.dart';
import 'package:kulfix/features/services_category/models/service_giver_filter.dart';

class CategoryRepository {

  Future<List<Map<String, dynamic>>> fetchProviders({
    required String serviceId,
    required ProviderFilter filter,
  }) async {

    final baseQuery = supabase
        .from('providers')
        .select()
        .eq('service_id', serviceId);

    final response = switch (filter) {

      ProviderFilter.highestRated =>
        await baseQuery.order('rating', ascending: false),

      ProviderFilter.lowestRated =>
        await baseQuery.order('rating', ascending: true),

      ProviderFilter.mostReviewed =>
        await baseQuery.order('total_reviews', ascending: false),

      ProviderFilter.all =>
        await baseQuery.order('rating', ascending: false),
    };

    return List<Map<String, dynamic>>.from(response);
  }
}