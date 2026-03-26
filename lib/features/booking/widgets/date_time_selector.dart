import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';

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

String formatTimeOfDay(TimeOfDay time) {
  final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
  final minute = time.minute.toString().padLeft(2, '0');
  final period = time.period == DayPeriod.am ? "AM" : "PM";

  return "$hour:$minute $period";
}
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
      
         Column(
  children: [

    GestureDetector(
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: date,
          firstDate: DateTime.now(),
          lastDate: DateTime(2030),
        );

        if (pickedDate != null) {
          notifier.changeDate(pickedDate);
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            "${date.day}-${date.month}-${date.year}",
          ),
        ),
      ),
    ),

    const SizedBox(height: 12),

   
    Row(
      children: [

        Expanded(
          child: GestureDetector(
           onTap: () async {

             notifier.clearError();
            final pickedTime = await showTimePicker(
              context: context,
              initialTime: startTime,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(alwaysUse24HourFormat: false),
                  child: child!,
                );
              },
            );

            if (pickedTime != null) {
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
                "Start: ${formatTimeOfDay(startTime)}",
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

  
        Expanded(
          child: GestureDetector(
            onTap: () async {

               notifier.clearError();
              final pickedTime = await showTimePicker(
                context: context,
                initialTime: endTime,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(alwaysUse24HourFormat: false),
                    child: child!,
                  );
                },
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
                "End: ${formatTimeOfDay(endTime)}",
              ),
            ),
          ),
        ),
      ],
    ),

    
   Consumer(
      builder: (context, ref, _) {
        final booking = ref.watch(bookingFilterProvider);

        if (booking.errorMessage == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            booking.errorMessage!,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        );
      },
    ),
  ],
)
        ],
      ),
    );
  }
}