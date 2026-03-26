import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_summary/providers/booking_confirmed_provider.dart';
import 'package:kulfix/features/booking_summary/widgets/action_button.dart';
import 'package:kulfix/features/booking_summary/widgets/booking_info_card.dart';
import 'package:kulfix/features/booking_summary/widgets/success_icon.dart';

class BookingConfirmedScreen extends ConsumerWidget {

  final String providerId;
   final String bookingId;

  const BookingConfirmedScreen({
    super.key,
    required this.providerId,
    required this.bookingId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final data = ref.watch(bookingConfirmedProvider(providerId));

    if (data.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              const SizedBox(height: 30),

              const SuccessIcon(),

              const SizedBox(height: 20),

              const Text(
                "Booking Confirmed!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your cleaning service is booked.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 10),

              Text(
                "#$bookingId",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30),

              BookingInfoCard(data),

              const Spacer(),

              const ActionButtons(),
            ],
          ),
        ),
      ),
    );
  }
}