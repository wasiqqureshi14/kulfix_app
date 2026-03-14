/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/screens/booking_summary_screen.dart';

class ContinueButton extends ConsumerWidget {

  const ContinueButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  

    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),

        onPressed: () {

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const BookingSummaryScreen(),
            ),
          );
        },

        child: const Text(
          "CONTINUE TO SUMMARY",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}*/