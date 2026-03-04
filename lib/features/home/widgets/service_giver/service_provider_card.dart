import 'package:flutter/material.dart';

class ProviderCard extends StatelessWidget {
  final Map provider;
  final VoidCallback onTap;

  const ProviderCard({
    super.key,
    required this.provider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.08),
              blurRadius: 8,
            )
          ],
        ),
        child: Row(
          children: [

            const CircleAvatar(radius: 26),

            const SizedBox(width: 12),

           
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(provider['full_name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text(provider['profession'],
                      style: const TextStyle(
                          color: Colors.grey)),

                  const SizedBox(height: 4),

                  Row(
                    children: [
                      const Icon(Icons.star,
                          color: Colors.orange, size: 16),
                      Text(
                          "${provider['rating']} (${provider['total_reviews']})")
                    ],
                  )
                ],
              ),
            ),

            /// button
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Text(
                "Book\nNow",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontSize: 11),
              ),
            )
          ],
        ),
      ),
    );
  }
}