import 'package:flutter/material.dart';

class ProviderCardLarge extends StatelessWidget {
  final Map provider;

  const ProviderCardLarge({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        children: [

          Row(
            children: [

              const CircleAvatar(radius: 26),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Text(provider['full_name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),

                    Text(provider['profession'],
                        style:
                            const TextStyle(color: Colors.grey)),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Colors.orange, size: 16),
                        Text(
                            "${provider['rating']} (${provider['total_reviews']})"),
                      ],
                    ),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: const Text("Stage 1"),
              )
            ],
          ),

          const SizedBox(height: 14),

          Center(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(
        horizontal: 24, // controls button width
       
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {},
    child: const Text("Book Now",
    style: TextStyle(color: Colors.white),),
  ),
),
        ],
      ),
    );
  }
}