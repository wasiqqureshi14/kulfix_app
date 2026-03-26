import 'package:kulfix/core/services/supabase_services.dart';

class BookingRepository {

  

 Future<String> createBooking({
  required String providerId,
  required String serviceId,
  required DateTime date,
  required String startTime,
  required String endTime,
  required int totalPrice,
  required String address,
}) async {

  final user = supabase.auth.currentUser;

  final response = await supabase
      .from('bookings')
      .insert({
        'provider_id': providerId,
        'service_id': serviceId,
        'user_id': user?.id,
        'booking_date': date.toIso8601String().split('T').first,
        'start_time': startTime,
        'end_time': endTime,
        'total_price': totalPrice,
        'address': address,
        'booking_status': 'confirmed',
      })
      .select()
      .single();

  /// ✅ Return booking ID
  return response['id'].toString();
}
}