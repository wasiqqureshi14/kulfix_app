import 'package:flutter/material.dart';

class ConfirmBookingButton extends StatelessWidget {

  final Map data;

  const ConfirmBookingButton(this.data, {super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 55,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
        ),

        onPressed: () {},

        child: Text(
          "CONFIRM & PAY ${data["total"]} QAR",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}