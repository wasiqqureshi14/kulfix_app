import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';

class BookingTypeSelector extends ConsumerWidget {

  final String type;

  const BookingTypeSelector({super.key, required this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

   final notifier = ref.read(bookingFilterProvider.notifier);

    return Container(
        padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0,0),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "BOOKING TYPE",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 14),

          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              ChoiceChip(
                label: const Text("Book Now"),
                selected: type == "book_now",
                onSelected: (_) => notifier.changeType("book_now"),
              ),
          
              const SizedBox(width: 10),
          
              ChoiceChip(
                label: const Text("Schedule"),
                selected: type == "schedule",
                onSelected: (_) => notifier.changeType("schedule"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}