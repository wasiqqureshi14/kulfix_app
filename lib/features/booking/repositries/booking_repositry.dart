import 'package:kulfix/core/services/supabase_services.dart';
import '../providers/booking_state.dart';

class BookingRepository {

  Future<void> createBooking({
    required String providerId,
    required String serviceId,
    required String professionId,
    required BookingState state,
  }) async {

    final userId = supabase.auth.currentUser!.id;

    await supabase.from('bookings').insert({
      'user_id': userId,
      'provider_id': providerId,
      'service_id': serviceId,
      'profession_id': professionId,
      'booking_type': state.bookingType,
      'booking_date': state.date.toIso8601String(),
      'booking_time':"${state.time.hour.toString().padLeft(2,'0')}:${state.time.minute.toString().padLeft(2,'0')}",
      'duration_hours': state.duration,
      'address': state.address,
      'booking_status': 'pending'
    });
  }
}