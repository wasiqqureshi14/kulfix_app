import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/service_giver/providers/giver_provider.dart';
import 'package:kulfix/features/service_giver/widgets/giver_header.dart';
import 'package:kulfix/features/service_giver/widgets/review_cards.dart';

class ProviderDetailsScreen extends ConsumerWidget {

  final String providerId;

  const ProviderDetailsScreen({
    super.key,
    required this.providerId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state =
        ref.watch(providerDetailsProvider(providerId));

    return Scaffold(
      backgroundColor: Colors.white,

      body: state.when(

        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),

        error: (e, _) => Center(
          child: Text(e.toString()),
        ),

        data: (provider) {

          final reviews = provider['reviews'] ?? [];

          return CustomScrollView(

            slivers: [

              /// HEADER (blue gradient section)
              SliverToBoxAdapter(
                child: ProviderHeader(provider: provider),
              ),

              /// REVIEWS TITLE
              const SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    "REVIEWS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),

              /// REVIEWS LIST
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(

                  delegate: SliverChildBuilderDelegate(

                    (context, index) {

                      final review = reviews[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: ReviewCard(review: review),
                      );
                    },

                    childCount: reviews.length,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}