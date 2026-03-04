import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/services_category/providers/service_category_provider.dart';
import 'package:kulfix/features/services_category/widgets/filter_bar.dart';
import 'package:kulfix/features/services_category/widgets/service_giver_large.dart';

class CategoryProvidersScreen extends ConsumerWidget {
  final String serviceId;
  final String serviceName;

  const CategoryProvidersScreen({
    super.key,
    required this.serviceId,
    required this.serviceName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    
    final providersAsync =
        ref.watch(categoryProviders(serviceId));

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      surfaceTintColor: Colors.transparent, 
       scrolledUnderElevation: 0, 
        title: Text(
          serviceName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

     
      body: Column(
        children: [

          ProviderFilterBar(serviceId: serviceId),

          Expanded(
            child: providersAsync.when(

        
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),

              error: (e, _) => const Center(
                child: Text("Failed to load providers"),
              ),

          
              data: (providers) {

                if (providers.isEmpty) {
                  return const Center(
                    child: Text("No providers available"),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: providers.length,
                  itemBuilder: (_, i) {

                    final provider = providers[i];

                    return ProviderCardLarge(
                      provider: provider,
                    
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}