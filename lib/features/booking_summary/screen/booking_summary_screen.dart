import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_summary/providers/booking_summary_providers.dart';
import 'package:kulfix/features/booking_summary/widgets/booking_summary_card.dart';

import '../widgets/booking_details_card.dart';

import '../widgets/confirm_booking_button.dart';

class BookingSummaryScreen extends ConsumerWidget {

  final String providerId;

  const BookingSummaryScreen({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(bookingSummaryProvider(providerId));

    if (data.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: const Text("Booking Summary"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            ProviderSummaryCard(data),

            const SizedBox(height: 20),

            BookingDetailsCard(data),

            const SizedBox(height: 20),

           // const PaymentMethodCard(),

            const Spacer(),

            ConfirmBookingButton(data)
          ],
        ),
      ),
    );
  }
}