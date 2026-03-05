import 'package:kulfix/core/services/supabase_services.dart';

class HomeRepository {

  
  Future<List<Map<String, dynamic>>> getServices() async {
    try {
      final response =
          await supabase.from('services').select();

      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      throw Exception('Failed to load services: $e');
    }
  }
}