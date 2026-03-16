import 'package:flutter/material.dart';

class ProviderHeader extends StatelessWidget {

  final Map provider;

  const ProviderHeader({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {

    final serviceName = provider['services']?['name'] ?? 'Service';
    final companyName = provider['companies']?['name'] ?? '';

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

           if (serviceName.isNotEmpty || companyName.isNotEmpty)
                          Text(
                            "$serviceName • $companyName",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                            ),
                          ),


          const SizedBox(height: 15),

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