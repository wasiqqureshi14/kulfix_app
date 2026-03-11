import 'package:flutter/material.dart';

class ProviderCardLarge extends StatelessWidget {
  final Map provider;
  final VoidCallback onTap;

  const ProviderCardLarge({super.key, required this.provider,  required this.onTap,});

  @override
Widget build(BuildContext context) {

  final professionList = provider['provider_professions'];

String profession = 'No profession';
String price = 'N/A';

if (professionList != null && professionList.isNotEmpty) {
  final profData = professionList[0];

  final prof = profData['professions'];

  if (prof != null && prof['name'] != null) {
    profession = prof['name'];
  }

  if (profData['price'] != null) {
    price = profData['price'].toString();
  }
}


    return InkWell(
       onTap: onTap,
      child: Container(
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
      
                      
                          Text(provider['full_name'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
      
                      const SizedBox(height: 4),
            
                          Text(
                            profession,
                            style: const TextStyle(color: Colors.grey),
                          ),
      
                      const SizedBox(height: 6),
      
                          Row(
                            children: [
                              const Icon(Icons.star,
                                  color: Colors.orange, size: 16),
      
                                    Text(
                              "${provider['rating']} (${provider['total_reviews']})"),
                              
                               const SizedBox(width: 14),
      
                          Text(
                            "$price QAR /hr",
                            style: const TextStyle(
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
      onPressed: onTap,
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
      ),
    );
  }
}