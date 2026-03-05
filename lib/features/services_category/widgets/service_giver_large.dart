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
      child: 
          Row(
            children: [

              const CircleAvatar(radius: 26),

              const SizedBox(width: 14),

              Expanded(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [

                    Row(
                      children: [
                        Text(provider['full_name'],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),

                                const SizedBox(width: 10),

                                 Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color.fromARGB(57, 1, 228, 172),
                  borderRadius:
                      BorderRadius.circular(8),
                ),
                child: const Text("STAGE 1",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700
                ),
                ),
              )
                      ],
                    ),

                    const SizedBox(height: 4),

                 //   Text(provider['profession'],
                   //     style:
                     //       const TextStyle(color: Colors.grey)),

                    const SizedBox(height: 6),

                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.orange, size: 16),

                                  Text(
                            "${provider['rating']} (${provider['total_reviews']})"),
                            
                             const SizedBox(width: 14),

                    const Text(
                      "45 QAR /hr",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                          ],
                        ),
                      
                  ],
                ),
              ),

             
              const SizedBox(width: 10),

       /// Book Button
SizedBox(
  height: 60,
  width: 60,
  child: ElevatedButton(
    onPressed: () {
      // booking action here
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      padding: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: const Text(
      "Book",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
)
            ]
          )
        
      
    );
  }
}