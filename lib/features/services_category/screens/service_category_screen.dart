import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/service_giver/screen/service_giver_detail_screen.dart';
import 'package:kulfix/features/services_category/providers/service_category_provider.dart';
import 'package:kulfix/features/services_category/widgets/filter_bar.dart';
import 'package:kulfix/features/services_category/widgets/service_giver_card_sekelton.dart';
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

  final state = ref.watch(categoryProviders(serviceId));

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
          child: state.isLoading

              /// Skeleton loading
              ? ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 6,
                  itemBuilder: (_, __) =>
                      const ProviderCardSkeleton(),
                )

              /// Actual data
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.providers.length,

                  itemBuilder: (_, i) {

                    final provider =
                        state.providers[i];

                    return ProviderCardLarge(
  provider: provider,
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProviderDetailsScreen(
          providerId: provider['id'],
        ),
      ),
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