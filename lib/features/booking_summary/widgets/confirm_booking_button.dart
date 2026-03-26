import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_summary/providers/booking_controller.dart';

class ConfirmBookingButton extends ConsumerWidget {

  final Map data;

  const ConfirmBookingButton(this.data, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final bookingState = ref.watch(bookingControllerProvider);

    final isLoading = bookingState.isLoading;

    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),

        /// Disable button while loading
        onPressed: isLoading
            ? null
            : () {

               print("BUTTON CLICKED");

                ref.read(bookingControllerProvider.notifier)
                    .confirmBooking(
                      providerId: data["provider"]["id"],
                      serviceId: data["provider"]["service_id"],
                      price: data["price"],
                      context: context,
                    );
              },

        child: isLoading

            /// Loader inside button
            ? const SizedBox(
                height: 22,
                width: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )

            /// Normal text
            : const Text(
                "CONFIRM BOOKING",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}