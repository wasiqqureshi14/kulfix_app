import 'package:flutter/material.dart';

class BookingFilterState {

  final String serviceId;
  final DateTime date;
  final TimeOfDay time;
  final int duration;
  final String address;
  final String bookingType;

  BookingFilterState({
    required this.serviceId,
    required this.date,
    required this.time,
    required this.duration,
    required this.address,
    required this.bookingType,
  });

  BookingFilterState copyWith({
    String? serviceId,
    DateTime? date,
    TimeOfDay? time,
    int? duration,
    String? address,
     String? bookingType,
  }) {

    return BookingFilterState(
      serviceId: serviceId ?? this.serviceId,
      date: date ?? this.date,
      time: time ?? this.time,
      duration: duration ?? this.duration,
      address: address ?? this.address,
      bookingType: bookingType ?? this.bookingType,
    );
  }
}