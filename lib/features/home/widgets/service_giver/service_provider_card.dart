import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
final company = provider['companies']?['name'];
final price = provider['price']?.toString() ?? '0';
final service = provider['services']?['name'] ?? '';

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
                          
                        if (service.isNotEmpty || company.isNotEmpty)
                          Text(
                            "$service • $company",
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
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
                        "$price QAR /hr",
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
              //    ref.read(bookingProvider.notifier).startBooking(
    //  context,
    //  provider
  //);
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