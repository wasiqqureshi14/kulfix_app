import 'package:kulfix/core/services/supabase_services.dart';

class HomeRepository {

  /// Fetch services from Supabase
  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final response =
          await supabase.from('services').select();

      // Supabase returns List<dynamic>
      // convert safely to List<Map<String, dynamic>>
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load services: $e');
    }
  }
}