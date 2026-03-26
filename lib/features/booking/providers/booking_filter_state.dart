import 'package:flutter/material.dart';

class BookingFilterState {

  final String serviceId;
  final DateTime date;
  final TimeOfDay startTime;
final TimeOfDay endTime;
  final String address;
  final String bookingType;
  final String? errorMessage;

  BookingFilterState({
    required this.serviceId,
    required this.date,
   required this.startTime,
    required this.endTime,
    required this.address,
    required this.bookingType,
    this.errorMessage,
  });

  BookingFilterState copyWith({
    String? serviceId,
    DateTime? date,
      TimeOfDay? startTime,
    TimeOfDay? endTime,
    String? address,
     String? bookingType,
     String? errorMessage,
     bool clearError = false,
  }) {

    return BookingFilterState(
      serviceId: serviceId ?? this.serviceId,
      date: date ?? this.date,
       startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      address: address ?? this.address,
      bookingType: bookingType ?? this.bookingType,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
    );
  }
}