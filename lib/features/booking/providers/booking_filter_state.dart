import 'package:flutter/material.dart';

class BookingFilterState {

  final String serviceId;
  final DateTime date;
  final TimeOfDay startTime;
final TimeOfDay endTime;
  final String address;
  final String bookingType;

  BookingFilterState({
    required this.serviceId,
    required this.date,
   required this.startTime,
    required this.endTime,
    required this.address,
    required this.bookingType,
  });

  BookingFilterState copyWith({
    String? serviceId,
    DateTime? date,
      TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? address,
     String? bookingType,
  }) {

    return BookingFilterState(
      serviceId: serviceId ?? this.serviceId,
      date: date ?? this.date,
       startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      address: address ?? this.address,
      bookingType: bookingType ?? this.bookingType,
    );
  }
}