import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/booking/screens/booking_screen.dart';
import 'booking_state.dart';

class BookingNotifier extends StateNotifier<BookingState> {

  BookingNotifier()
      : super(
          BookingState(
            providerId: "",
            providerName: "",
            serviceId: "",
            serviceName: "",
            professionName: "",
            rate: 0,
            bookingType: "book_now",
            date: DateTime.now(),
            time: const TimeOfDay(hour: 14, minute: 0),
            duration: 4,
            address: "",
          ),
        );
        void setProvider(Map provider) {

  final professionList = provider['provider_professions'];

  double rate = 0;
  String professionName = "";

  if (professionList != null && professionList.isNotEmpty) {

    final profession = professionList[0];

    rate = double.tryParse(profession['price'].toString()) ?? 0;

    professionName = profession['professions']?['name'] ?? "";
  }

  final serviceName = provider['services']?['name'] ?? "";

  state = state.copyWith(
    providerId: provider['id'] ?? "",
    providerName: provider['full_name'] ?? "",
    serviceId: provider['service_id'] ?? "",
    serviceName: serviceName,
    professionName: professionName,
    rate: rate,
  );
}

  void startBooking(BuildContext context, Map provider) {

  final professionList = provider['provider_professions'];

  double rate = 0;
  String professionName = "";

  if (professionList != null && professionList.isNotEmpty) {
    final profession = professionList[0];

    rate = double.tryParse(profession['price'].toString()) ?? 0;

    professionName = profession['professions']?['name'] ?? "";
  }

  final serviceName = provider['services']?['name'] ?? "";

  state = state.copyWith(
    providerId: provider['id'] ?? "",
    providerName: provider['full_name'] ?? "",
    serviceId: provider['service_id'] ?? "",
    serviceName: serviceName,
    professionName: professionName,
    rate: rate,
  );

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const BookingScreen(),
    ),
  );
}

  void changeType(String type) {
    state = state.copyWith(bookingType: type);
  }

  void changeDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  void changeTime(TimeOfDay time) {
    state = state.copyWith(time: time);
  }

  void increaseDuration() {
    state = state.copyWith(duration: state.duration + 1);
  }

  void decreaseDuration() {
    if (state.duration > 1) {
      state = state.copyWith(duration: state.duration - 1);
    }
  }

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }
}

final bookingProvider =
    StateNotifierProvider<BookingNotifier, BookingState>(
        (ref) => BookingNotifier());