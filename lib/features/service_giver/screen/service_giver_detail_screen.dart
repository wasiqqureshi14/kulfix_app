import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/booking_summary/screen/booking_summary_screen.dart';
import 'package:kulfix/features/service_giver/providers/giver_provider.dart';
import 'package:kulfix/features/service_giver/widgets/buttom_booking_bar.dart';
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

    final state = ref.watch(providerDetailsProvider(providerId));

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

              SliverToBoxAdapter(
                child: ProviderHeader(provider: provider),
              ),

              const SliverPadding(
                padding: EdgeInsets.fromLTRB(16, 10, 16, 10),
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
              ),

              const SliverToBoxAdapter(
                child: SizedBox(height: 120),
              ),
            ],
          );
        },
      ),

      bottomNavigationBar: state.maybeWhen(

        data: (provider) {

         final price = provider['price']?.toString() ?? "0";

          return BookingBar(
            price: price,
            providerName: provider['full_name'],
            onBook: () {
            
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (_) => BookingSummaryScreen(
      providerId: providerId,
    ),
  ),
);

            },
          );
        },

        orElse: () => const SizedBox(),
      ),
    );
  }
}