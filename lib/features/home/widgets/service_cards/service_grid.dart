import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/providers/home_provider.dart';
import 'package:kulfix/features/home/widgets/service_cards/service_card.dart';
import 'package:kulfix/features/service_preference/screen/service_prefrence_screen.dart';

class ServiceGrid extends ConsumerWidget {
  const ServiceGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final servicesAsync = ref.watch(servicesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 24),

        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            "SERVICES",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),


        servicesAsync.when(
          loading: () => Padding(
            padding: EdgeInsets.all(20),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        
          /// ERROR
          error: (e, _) => Padding(
            padding: EdgeInsets.all(20),
            child: const Center(
              child: Text("Failed to load services"),
            ),
          ),
        
          data: (services) {
          final screenWidth = MediaQuery.of(context).size.width;
          return SizedBox(
           height: screenWidth * 0.60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              itemCount: services.length,

              separatorBuilder: (_, __) =>
                  SizedBox(width: 14),

              itemBuilder: (_, i) {

              final service = services[i];

              return SizedBox(
               width: screenWidth * 0.45,
                child: ServiceCard(
                  service: service,
                  onTap: () {
                    
                    if (service['available'] != true) return;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CleaningPreferenceScreen(
                          serviceId: service['id'].toString(),
                          serviceName: service['name'].toString(),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            ),
          );
        },
        ),
      ],
    );
  }
}