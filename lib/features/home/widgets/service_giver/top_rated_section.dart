import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/providers/top_rated_provider.dart';
import 'package:kulfix/features/home/widgets/service_giver/service_provider_card.dart';
import 'package:kulfix/features/service_giver/screen/service_giver_detail_screen.dart';

class TopRatedSection extends ConsumerWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final providersAsync = ref.watch(topRatedProvider);
    final providers = providersAsync.value ?? [];

    return Padding(
      padding: const EdgeInsets.all(15),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  const Text(
                    "TOP RATED",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  ),

                       TextButton(
                          onPressed: () {
                            ref
                                .read(topRatedProvider.notifier)
                                .loadMore();
                          },
                          child: const Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                ],
              ),

          const SizedBox(height: 10),

          SizedBox(
            height: 260,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: providers.length,

              separatorBuilder: (_, __) =>
                  const SizedBox(width: 12),

              itemBuilder: (_, i) {

                final p = providers[i];

                return ProviderCard(
                  provider: p,
                  onTap: () {
                     Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProviderDetailsScreen(
          providerId: p['id'],
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