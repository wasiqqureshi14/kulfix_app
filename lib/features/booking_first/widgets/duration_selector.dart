import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_first/providers/booking_filter_notifier.dart';

class DurationSelector extends ConsumerWidget {

  final int duration;

  const DurationSelector({
    super.key,
    required this.duration,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notifier = ref.read(bookingFilterProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0,4),
          )
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "DURATION (HOURS)",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 13,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              _button(
                icon: Icons.remove,
                onTap: notifier.decreaseDuration,
              ),

              const SizedBox(width: 30),

              Column(
                children: [

                  Text(
                    duration.toString(),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 30),

              _button(
                icon: Icons.add,
                onTap: notifier.increaseDuration,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _button({
    required IconData icon,
    required VoidCallback onTap,
  }) {

    return GestureDetector(

      onTap: onTap,

      child: Container(
        height: 50,
        width: 50,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.black,
            width: 1.5,
          ),
        ),

        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}