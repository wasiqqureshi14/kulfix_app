import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/providers/booking_provider.dart';

class AddressSelector extends ConsumerWidget {

  final String address;

  const AddressSelector({super.key, required this.address});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notifier = ref.read(bookingProvider.notifier);

    return TextField(

      decoration: const InputDecoration(
        labelText: "Address",
        border: OutlineInputBorder(),
      ),

      onChanged: notifier.setAddress,
    );
  }
}