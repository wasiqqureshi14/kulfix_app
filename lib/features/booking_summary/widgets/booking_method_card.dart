import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {

  const PaymentMethodCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue),
      ),

      child: Row(
        children: const [

          Icon(Icons.credit_card),

          SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Visa ****4582"),
              Text("Default card",
                  style: TextStyle(color: Colors.grey))
            ],
          ),

          Spacer(),

          Icon(Icons.check, color: Colors.blue)
        ],
      ),
    );
  }
}