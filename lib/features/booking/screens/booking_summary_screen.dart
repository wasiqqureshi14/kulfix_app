/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/booking_provider.dart';

class BookingSummaryScreen extends ConsumerWidget {

  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final booking = ref.watch(bookingProvider);

    final total = booking.rate * booking.duration;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Booking Summary"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            Container(
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.only(bottom: 16),

  decoration: BoxDecoration(
    color: const Color(0xffF5F7FB),
    borderRadius: BorderRadius.circular(16),
  ),

  child: Row(
    children: [

      CircleAvatar(
        radius: 26,
        
      ),

      const SizedBox(width: 14),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            booking.providerName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

        Text(
  booking.professionName,
  style: const TextStyle(
    color: Colors.grey,
  ),
),
        ],
      )
    ],
  ),
),

            Container(
              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),

              child: Column(
                children: [

                  _row("Service", booking.serviceName),

                  _row(
                    "Date",
                    "${booking.date.day}-${booking.date.month}-${booking.date.year}",
                  ),

                  _row("Time", booking.time.format(context)),

                  _row("Duration", "${booking.duration} hours"),

                  _row("Rate", "${booking.rate} QAR/hr"),

                  _row("Address", booking.address),

                  const Divider(),

                  _row(
                    "Total",
                    "$total QAR",
                    isTotal: true,
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),

                onPressed: () {},

                child: Text(
                  "CONFIRM & PAY $total QAR",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value, {bool isTotal = false}) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Text(
            label,
            style: const TextStyle(color: Colors.grey),
          ),

          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
              fontSize: isTotal ? 18 : 15,
               color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}*/