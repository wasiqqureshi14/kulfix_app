import 'package:flutter/material.dart';

class ProviderSummaryCard extends StatelessWidget {

  final Map data;

  const ProviderSummaryCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {

    final provider = data["provider"];

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
      ),

      child: Row(
        children: [

          const CircleAvatar(radius: 28),

          const SizedBox(width: 12),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                provider['full_name'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),

              Text(
                data["company"],
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}