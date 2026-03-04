import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/services_category/screens/service_category_screen.dart';
import '../widgets/preference_card.dart';

class CleaningPreferenceScreen extends ConsumerWidget {
  final String serviceId;
  final String serviceName;

  const CleaningPreferenceScreen({
    super.key,
    required this.serviceId,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TOP ROW
              SizedBox(height: 10),

              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 60),

              Center(
                child: Column(
                  children: [
 
               Text(
                  "How Would You Like To Book Your Services",
                   textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                ),
                 SizedBox(height: 10),
              
                    Text(
                     "Choose Your $serviceName Preference",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 35),

              /// ONE CLEANER
              PreferenceCard(
                title: "One Person",
                subtitle: "Single professional for your task",
                 imagePath: "assets/images/singal-01.svg",
                isButtonDisabled: false,
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
              ),

              SizedBox(height: 20),

              /// FULL TEAM (DISABLED FOR NOW)
              PreferenceCard(
                title: "Full Team",
                subtitle: "A team for bigger and faster service",
                 imagePath: "assets/images/Full-team-01.svg",
                isButtonDisabled: true,
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}