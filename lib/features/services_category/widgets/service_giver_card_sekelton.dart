import 'package:flutter/material.dart';

class ProviderCardSkeleton extends StatelessWidget {
  const ProviderCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Row(
        children: [

          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 12,
                  width: 120,
                  color: Colors.grey.shade300,
                ),

                const SizedBox(height: 8),

                Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}