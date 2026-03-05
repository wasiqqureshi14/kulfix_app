import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {

  final Map review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Text(
                review['user_id'] ?? "User",
                style: const TextStyle(
                    fontWeight: FontWeight.bold),
              ),

              Text(
                review['created_at'] ?? "",
                style:
                    const TextStyle(color: Colors.grey),
              ),
            ],
          ),

          const SizedBox(height: 6),

          Row(
            children: List.generate(
              review['rating'],
              (index) => const Icon(
                Icons.star,
                color: Colors.orange,
                size: 16,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(review['review_text'] ?? "")
        ],
      ),
    );
  }
}