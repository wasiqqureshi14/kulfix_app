import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_first/providers/booking_filter_notifier.dart';
import 'package:kulfix/features/booking_first/data/service_giver_filter_repositry.dart';

final providerFilterRepositoryProvider =
    Provider((ref) => ProviderFilterRepository());

final filteredProvidersProvider = FutureProvider<List<Map<String,dynamic>>>((ref) async {

final booking = ref.watch(bookingFilterProvider);
  final repo = ref.watch(providerFilterRepositoryProvider);

 final start =
    "${booking.startTime.hour.toString().padLeft(2,'0')}:${booking.startTime.minute.toString().padLeft(2,'0')}";

final end =
    "${booking.endTime.hour.toString().padLeft(2,'0')}:${booking.endTime.minute.toString().padLeft(2,'0')}";

  return repo.getFilteredProviders(
    serviceId: booking.serviceId,
    date: booking.date,
    startTime: start,
    endTime: end,
  );
});