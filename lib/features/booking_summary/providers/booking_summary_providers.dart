import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';
import 'package:kulfix/features/service_giver/providers/giver_provider.dart';

final bookingSummaryProvider =
    Provider.family<Map<String, dynamic>, String>((ref, providerId) {

  final booking = ref.watch(bookingFilterProvider);
  final providerAsync = ref.watch(providerDetailsProvider(providerId));

  return providerAsync.when(

    loading: () => {},

    error: (e, _) => {},

    data: (provider) {

      final price = provider['price'] ?? 0;

      final start = booking.startTime;
final end = booking.endTime;

final duration = end.hour - start.hour;
final total = price * duration;


     

      final dateFormatted =
          DateFormat('dd-MM-yyyy').format(booking.date);

      return {
        "provider": provider,
        "service": provider['services']?['name'] ?? '',
        "company": provider['companies']?['name'] ?? '',
        "price": price,
        "duration": duration,
        "total": total,
        "date": dateFormatted,
        "time": booking.startTime,
        "address": booking.address
      };
    },
  );
});