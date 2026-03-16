import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/booking/providers/booking_filter_state.dart';

class BookingFilterNotifier extends StateNotifier<BookingFilterState> {

 BookingFilterNotifier()
      : super(
         BookingFilterState(
  serviceId: "",
  date: DateTime.now(),
  startTime: const TimeOfDay(hour: 14, minute: 0),
endTime: const TimeOfDay(hour: 18, minute: 0),
  bookingType: "book_now",
  address: "",
)
        );

  void changeDate(DateTime date) {
    state = state.copyWith(date: date);
  }

 void changeStartTime(TimeOfDay time) {
  state = state.copyWith(startTime: time);
}

void changeEndTime(TimeOfDay time) {
  final startMinutes = state.startTime.hour * 60 + state.startTime.minute;
  final endMinutes = time.hour * 60 + time.minute;

  if (endMinutes - startMinutes < 240) {
    return;
  }

  state = state.copyWith(endTime: time);
}

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setService(String serviceId) {
  state = state.copyWith(serviceId: serviceId);
}

void changeType(String type) {

  if(type == "book_now"){

    state = state.copyWith(
      bookingType: type,
      date: DateTime.now(),
      startTime: TimeOfDay.now(),
    );

  }else{

    state = state.copyWith(
      bookingType: type,
    );

  }
}

  void resetFilter() {

    state = BookingFilterState(
       serviceId: "",
      date: DateTime.now(),
      startTime: const TimeOfDay(hour: 14, minute: 0),
      endTime: const TimeOfDay(hour: 18, minute: 0),
      address: "",
       bookingType: "book_now",
    );
  }
}

final bookingFilterProvider =
    StateNotifierProvider<BookingFilterNotifier, BookingFilterState>(
  (ref) => BookingFilterNotifier(),
);