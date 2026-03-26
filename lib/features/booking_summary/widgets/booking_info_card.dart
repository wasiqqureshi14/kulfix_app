import 'package:flutter/material.dart';

class BookingInfoCard extends StatelessWidget {

  final Map data;

  const BookingInfoCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [

          infoRow("Provider", data["providerName"]),
          infoRow("Date", data["date"]),
          infoRow("Time", data["time"].format(context)),
          infoRow("Duration", "${data["duration"]} hours"),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text("Total Paid"),

              Text(
                "${data["total"]} QAR",
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget infoRow(String title, String value) {

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}