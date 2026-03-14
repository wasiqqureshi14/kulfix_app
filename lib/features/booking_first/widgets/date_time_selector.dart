import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_first/providers/booking_filter_notifier.dart';

class DateTimeSelector extends ConsumerWidget {

  final DateTime date;
  final TimeOfDay startTime;
final TimeOfDay endTime;

  const DateTimeSelector({
    super.key,
    required this.date,
    required this.startTime,
  required this.endTime,
  });

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
            "Date & Time",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
                 letterSpacing: 1,
            ),
          ),
      
          const SizedBox(height: 12),
      
          Row(
            children: [
      
              Expanded(
                child: GestureDetector(
                  onTap: () async {

  final booking = ref.read(bookingFilterProvider);

  if (booking.bookingType == "book_now") {
    return;
  }

  final pickedDate = await showDatePicker(
    context: context,
    initialDate: booking.date,
    firstDate: DateTime.now(),
    lastDate: DateTime(2030),
  );

  if (pickedDate != null) {
    notifier.changeDate(pickedDate);
  }
},
      
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 16,
                    ),
      
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
      
                    child: Text(
                      "${date.day}-${date.month}-${date.year}",
                    ),
                  ),
                ),
              ),
      
              const SizedBox(width: 12),
      
             Expanded(
  child: GestureDetector(
    onTap: () async {

     final booking = ref.read(bookingFilterProvider);

final pickedTime = await showTimePicker(
  context: context,
  initialTime: startTime,
);

if (pickedTime != null) {

  if (booking.bookingType == "book_now") {

    final now = TimeOfDay.now();

    if (pickedTime.hour < now.hour ||
        (pickedTime.hour == now.hour && pickedTime.minute < now.minute)) {
      return;
    }

  }

  notifier.changeStartTime(pickedTime);
}

    },

    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Text(
        "Start: ${startTime.format(context)}",
      ),
    ),
  ),
),
Expanded(
  child: GestureDetector(
    onTap: () async {

      final pickedTime = await showTimePicker(
        context: context,
        initialTime: endTime,
      );

      if (pickedTime != null) {
        notifier.changeEndTime(pickedTime);
      }

    },

    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),

      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Text(
        "End: ${endTime.format(context)}",
      ),
    ),
  ),
),
            ],
          )
        ],
      ),
    );
  }
}