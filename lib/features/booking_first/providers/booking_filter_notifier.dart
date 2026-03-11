import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/booking_first/providers/booking_filter_state.dart';

class BookingFilterNotifier extends StateNotifier<BookingFilterState> {

 BookingFilterNotifier()
      : super(
         BookingFilterState(
  serviceId: "",
  date: DateTime.now(),
  time: const TimeOfDay(hour: 14, minute: 0),
  duration: 4,
  bookingType: "book_now",
  address: "",
)
        );

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

  void setService(String serviceId) {
  state = state.copyWith(serviceId: serviceId);
}

void changeType(String type) {

  if(type == "book_now"){

    state = state.copyWith(
      bookingType: type,
      date: DateTime.now(),
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
      time: const TimeOfDay(hour: 14, minute: 0),
      duration: 4,
      address: "",
       bookingType: "book_now",
    );
  }
}

final bookingFilterProvider =
    StateNotifierProvider<BookingFilterNotifier, BookingFilterState>(
  (ref) => BookingFilterNotifier(),
);