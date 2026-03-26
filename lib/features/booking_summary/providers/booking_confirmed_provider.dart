import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';
import 'package:kulfix/features/service_giver/providers/giver_provider.dart';

final bookingConfirmedProvider =
    Provider.family<Map<String, dynamic>, String>((ref, providerId) {

  final booking = ref.watch(bookingFilterProvider);
  final providerAsync = ref.watch(providerDetailsProvider(providerId));

  return providerAsync.when(
    loading: () => {},
    error: (_, __) => {},
    data: (provider) {

      final start = booking.startTime;
      final end = booking.endTime;

      final duration = end.hour - start.hour;
      final price = provider['price'];
      final total = price * duration;

      final dateFormatted =
          DateFormat('dd MMM yyyy').format(booking.date);

      final timeFormatted = booking.startTime;

      return {
        "providerName": provider['full_name'],
        "date": dateFormatted,
        "time": timeFormatted,
        "duration": duration,
        "total": total,
      };
    },
  );
});