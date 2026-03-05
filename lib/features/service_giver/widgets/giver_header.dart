import 'package:flutter/material.dart';

class ProviderHeader extends StatelessWidget {

  final Map provider;

  const ProviderHeader({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {

    final profList = provider['provider_professions'];

    String profession = 'No profession';

    if (profList != null && profList.isNotEmpty) {
      profession = profList[0]['professions']['name'];
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        top: 60,
        bottom: 30,
      ),

      child: Column(
        children: [

          const CircleAvatar(
            radius: 60,
          ),

          const SizedBox(height: 12),

          Text(
            provider['full_name'],
            style: const TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            profession,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),

          const SizedBox(height: 24),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            children: [

              statBox(
                provider['rating'].toString(),
                "Rating",
              ),

              statBox(
                provider['total_reviews'].toString(),
                "Reviews",
              ),

              
            ],
          )
        ],
      ),
    );
  }
}

Widget statBox(String value, String label) {

  return Column(
    children: [

      Text(
        value,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),

      Text(
        label,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    ],
  );
}