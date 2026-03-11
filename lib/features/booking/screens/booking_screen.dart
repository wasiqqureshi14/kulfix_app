import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_first/widgets/date_time_selector.dart';
import '../providers/booking_provider.dart';
import '../../booking_first/widgets/booking_type_selector.dart';
import '../../booking_first/widgets/duration_selector.dart';
import '../../booking_first/widgets/address_selector.dart';
import '../../booking_first/widgets/continue_button.dart';

class BookingScreen extends ConsumerWidget {

  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final booking = ref.watch(bookingProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Booking")),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            BookingTypeSelector(type: booking.bookingType),

            const SizedBox(height: 20),

            DateTimeSelector(
              date: booking.date,
              time: booking.time,
            ),

            const SizedBox(height: 20),

            DurationSelector(duration: booking.duration),

            const SizedBox(height: 20),

            AddressSelector(address: booking.address),

            const SizedBox(height: 40),

            const ContinueButton(),
          ],
        ),
      ),
    );
  }
}