import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {

  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              minimumSize: const Size.fromHeight(55),
            ),
            onPressed: () {},
            child: const Text("TRACK BOOKING"),
          ),
        ),

        const SizedBox(width: 10),

        Expanded(
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size.fromHeight(55),
            ),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
            child: const Text("BACK TO HOME"),
          ),
        ),
      ],
    );
  }
}