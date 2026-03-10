import 'package:flutter/material.dart';

class BookingState {

  final String providerId;
  final String providerName;
  final String serviceId;
  final String serviceName;
  final String professionName;
  final double rate;
  final String bookingType;
  final DateTime date;
  final TimeOfDay time;
  final int duration;
  final String address;

  BookingState({
    required this.providerId,
    required this.providerName,
    required this.serviceId,
    required this.serviceName,
    required this.professionName,
    required this.rate,
    required this.bookingType,
    required this.date,
    required this.time,
    required this.duration,
    required this.address,
  });

  BookingState copyWith({
    String? providerId,
    String? providerName,
    String? serviceId,
    String? serviceName,
    String? professionName,
    double? rate,
    String? bookingType,
    DateTime? date,
    TimeOfDay? time,
    int? duration,
    String? address,
  }) {

    return BookingState(
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      serviceId: serviceId ?? this.serviceId,
      serviceName: serviceName ?? this.serviceName,
      professionName: professionName ?? this.professionName,
      rate: rate ?? this.rate,
      bookingType: bookingType ?? this.bookingType,
      date: date ?? this.date,
      time: time ?? this.time,
      duration: duration ?? this.duration,
      address: address ?? this.address,
    );
  }
}