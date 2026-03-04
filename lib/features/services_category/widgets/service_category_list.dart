/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/widgets/service_giver/service_provider_card.dart';
import 'package:kulfix/features/services_category/providers/service_category_provider.dart';

class ProvidersList extends ConsumerWidget {
  final String category;

  const ProvidersList({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final providersAsync =
        ref.watch(categoryProvidersProvider(category));

    return providersAsync.when(

      /// LOADING
      loading: () =>
          const Center(child: CircularProgressIndicator()),

      /// ERROR
      error: (e, _) =>
          const Center(child: Text("Failed to load providers")),

      /// DATA
      data: (providers) {
        if (providers.isEmpty) {
          return const Center(
            child: Text("No providers available"),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(14),
          itemCount: providers.length,
          itemBuilder: (_, index) {
            return ProviderCard(
              provider: providers[index],
              onTap: () {},
            );
          },
        );
      },
    );
  }
}*/