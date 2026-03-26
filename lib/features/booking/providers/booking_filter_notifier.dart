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
          ),
        );

  
  int _toMinutes(TimeOfDay time) {
    return time.hour * 60 + time.minute;
  }

  
  TimeOfDay _addHours(TimeOfDay time, int hours) {
    final totalMinutes = _toMinutes(time) + (hours * 60);
    final newHour = (totalMinutes ~/ 60) % 24;
    final newMinute = totalMinutes % 60;

    return TimeOfDay(hour: newHour, minute: newMinute);
  }

  
  TimeOfDay _ensureMinEnd(TimeOfDay start) {
    return _addHours(start, 4);
  }

  void changeDate(DateTime date) {
    state = state.copyWith(date: date);
  }

  
  void changeStartTime(TimeOfDay time) {

    final now = TimeOfDay.now();

    if (state.bookingType == "book_now") {
      final nowMinutes = _toMinutes(now);
      final pickedMinutes = _toMinutes(time);

      if (pickedMinutes < nowMinutes) {
        return;
      }
    }

    final newEnd = _ensureMinEnd(time);
    state = state.copyWith(
      startTime: time,
      endTime: newEnd,
      errorMessage: null,
       clearError: true,
    );
  }

  void changeEndTime(TimeOfDay time) {

    final startMinutes = _toMinutes(state.startTime);
    var endMinutes = _toMinutes(time);

    if (endMinutes <= startMinutes) {
       endMinutes += 1440;
    state = state.copyWith(
      errorMessage: "End time must be after start time",
    );
    return;
  }

   if ((endMinutes - startMinutes) < 240) {
    state = state.copyWith(
      errorMessage: "Minimum service time must be 4 hours",
    );
    return;
  }

    state = state.copyWith(
    endTime: time,
    errorMessage: null,
     clearError: true,
  );
  }

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void setService(String serviceId) {
    state = state.copyWith(serviceId: serviceId);
  }

  void clearError() {
   state = state.copyWith(clearError: true);
}

  void changeType(String type) {

    if (type == "book_now") {

      final now = TimeOfDay.now();
      final end = _ensureMinEnd(now);

      state = state.copyWith(
        bookingType: type,
        date: DateTime.now(),
        startTime: now,
        endTime: end,
      );

    } else {

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