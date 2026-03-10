import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/providers/booking_provider.dart';

class ProviderCard extends ConsumerWidget {
  final Map provider;
  final VoidCallback onTap;

  const ProviderCard({
    super.key,
    required this.provider,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 
final professionList = provider['provider_professions'] as List?;

final company = provider['companies']?['name'];

String profession = 'No profession';
String price = 'N/A';

if (professionList != null && professionList.isNotEmpty) {
  final profData = professionList.first;

  final prof = profData['professions'];

  if (prof != null && prof['name'] != null) {
    profession = prof['name'];
  }

  if (profData['price'] != null) {
    price = profData['price'].toString();
  }
}

    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: 240,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 05,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
        ),
        child: Column(
          children: [

            const CircleAvatar(radius: 26),

            const SizedBox(width: 12),

           
           
                  Text(provider['full_name'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold)),

                        if (company != null)
  Text(
    company,
    style: const TextStyle(
      fontSize: 12,
      color: Colors.blueGrey,
      fontWeight: FontWeight.w600,
    ),
  ),


                 Text(
                    profession,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star,
                          color: Colors.orange, size: 16),
                      Text(
                          "${provider['rating']} (${provider['total_reviews']})")
                    ],
                  ),
                  const SizedBox(height: 10),
                  
Text(
  "$price /hr QAR",
  style: const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  ),
),

          const SizedBox(height: 14),

                  SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                  ref.read(bookingProvider.notifier).startBooking(
      context,
      provider
  );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "Book Now",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
                
              
          
          ],
        ),
      ),
    );
  }
}