import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/core/services/supabase_services.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';
import 'package:kulfix/features/booking_summary/data/booking_repositry.dart';
import 'package:kulfix/features/booking_summary/screen/booking_confirmed_screen.dart';

final bookingRepoProvider =
    Provider((ref) => BookingRepository());

class BookingController extends StateNotifier<AsyncValue<void>> {

  BookingController(this.ref)
      : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> confirmBooking({
    required String providerId,
    required String serviceId,
    required int price,
    required BuildContext context,
  }) async {

    state = const AsyncValue.loading();

    try {

      final booking = ref.read(bookingFilterProvider);

      final user = supabase.auth.currentUser;

       print("USER OBJECT: $user");
       print("USER ID: ${user?.id}");

      /// ✅ Your existing duration logic
      final start = booking.startTime;
      final end = booking.endTime;

      final duration = end.hour - start.hour;
      final total = price * duration;

      /// Format time for DB
      final startFormatted =
"${start.hour.toString().padLeft(2,'0')}:${start.minute.toString().padLeft(2,'0')}";

      final endFormatted =
"${end.hour.toString().padLeft(2,'0')}:${end.minute.toString().padLeft(2,'0')}";

      final repo = ref.read(bookingRepoProvider);

      final bookingId = await repo.createBooking(
  providerId: providerId,
  serviceId: serviceId,
  date: booking.date,
  startTime: startFormatted,
  endTime: endFormatted,
  totalPrice: total,
  address: booking.address,
);

/// Navigate with BOTH IDs
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (_) => BookingConfirmedScreen(
      providerId: providerId,
      bookingId: bookingId,
    ),
  ),
);

    } catch (e, st) {

        print("BOOKING ERROR: $e");

      state = AsyncValue.error(e, st);

    }
  }
}

final bookingControllerProvider =
    StateNotifierProvider<BookingController, AsyncValue<void>>(
        (ref) => BookingController(ref));