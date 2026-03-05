import 'package:flutter/material.dart';

IconData getServiceIcon(String? iconName) {

  switch (iconName) {

    case 'cleaning_services':
      return Icons.cleaning_services;

    case 'plumbing':
      return Icons.plumbing;

    case 'electrical_services':
      return Icons.electrical_services;

    case 'ac_unit':
      return Icons.ac_unit;

    case 'format_paint':
      return Icons.format_paint;

    case 'home_repair_service':
      return Icons.home_repair_service;

    default:
      return Icons.miscellaneous_services;
  }

}