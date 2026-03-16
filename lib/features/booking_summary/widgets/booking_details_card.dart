import 'package:flutter/material.dart';

class BookingDetailsCard extends StatelessWidget {

  final Map data;

  const BookingDetailsCard(this.data, {super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100),
      ),

      child: Column(
        children: [

          bookingRow("Service", data["service"]),
          bookingRow("Date", data["date"]),
          bookingRow("Time", data["time"].format(context)),
          bookingRow("Duration", "${data["duration"]} hours"),
          bookingRow("Rate", "${data["price"]} QAR/hr"),
          bookingRow("Address", data["address"]),

          const Divider(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Total",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "${data["total"]} QAR",
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

Widget bookingRow(String title, String value) {

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(title),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
      ],
    ),
  );
}