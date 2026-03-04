import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/providers/top_rated_provider.dart';
import 'package:kulfix/features/home/widgets/service_giver/service_provider_card.dart';
class TopRatedSection extends ConsumerWidget {
  const TopRatedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final providersAsync = ref.watch(topRatedProvider);

    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "TOP RATED",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          providersAsync.when(

            /// UI already visible, data loads behind
            loading: () =>
                const Center(child: CircularProgressIndicator()),

            error: (e, _) =>
                const Text("Failed to load providers"),

            data: (providers) => Column(
              children: [

                ...providers.map(
                  (p) => ProviderCard(
                    provider: p,
                    onTap: () {
                      /// navigate later
                    },
                  ),
                ),

                const SizedBox(height: 10),

                /// SHOW MORE BUTTON
                TextButton(
                  onPressed: () {
                    ref
                        .read(topRatedProvider.notifier)
                        .loadMore();
                  },
                  child: const Text("Show More",
                  style: TextStyle(fontSize: 12,
                   fontWeight: FontWeight.w600,
                   color: Colors.black),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}