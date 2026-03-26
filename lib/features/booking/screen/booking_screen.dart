import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking/widgets/address_selector.dart';
import 'package:kulfix/features/booking/widgets/booking_type_selector.dart';
import 'package:kulfix/features/booking/widgets/date_time_selector.dart';
import 'package:kulfix/features/booking/providers/booking_filter_notifier.dart';
import 'package:kulfix/features/services_category/screens/service_category_screen.dart';

class BookingScreens extends ConsumerWidget {

  final String serviceId;
  final String serviceName;

  const BookingScreens({
    super.key,
    required this.serviceId,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
   WidgetsBinding.instance.addPostFrameCallback((_) {
  ref.read(bookingFilterProvider.notifier).setService(serviceId);
});

   final booking = ref.watch(bookingFilterProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Choose Booking Time")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          BookingTypeSelector(type: booking.bookingType),

          const SizedBox(height: 20),

            DateTimeSelector(
              date: booking.date,
               startTime: booking.startTime,
               endTime: booking.endTime,
            ),

            const SizedBox(height: 20),


            const SizedBox(height: 20),

            AddressSelector(address: booking.address),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
                onPressed: () {

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                     builder: (_) => CategoryProvidersScreen(
                          serviceId: serviceId,
                          serviceName: serviceName,
                        ),
                    ),
                  );

                },
                child: const Text("Find Service Providers",
                style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}