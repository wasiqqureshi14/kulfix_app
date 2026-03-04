import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/services_category/providers/service_category_provider.dart';
import '../models/service_giver_filter.dart';

class ProviderFilterBar extends ConsumerWidget {
  final String serviceId;

  const ProviderFilterBar({
    super.key,
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final notifier =
        ref.read(categoryProviders(serviceId).notifier);

    final selectedFilter =
        notifier.selectedFilter;

    return Padding(
      /// ✅ GAP BETWEEN APPBAR & FILTER ROW
      padding: const EdgeInsets.only(top: 12, bottom: 10),
      child: SizedBox(
        height: 42,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [

            _FilterChip(
              title: "All",
              selected:
                  selectedFilter == ProviderFilter.all,
              onTap: () =>
                  notifier.changeFilter(ProviderFilter.all),
            ),

            _FilterChip(
              title: "Highest Rated",
              selected: selectedFilter ==
                  ProviderFilter.highestRated,
              onTap: () => notifier.changeFilter(
                  ProviderFilter.highestRated),
            ),

            _FilterChip(
              title: "Lowest Rated",
              selected: selectedFilter ==
                  ProviderFilter.lowestRated,
              onTap: () => notifier.changeFilter(
                  ProviderFilter.lowestRated),
            ),

            _FilterChip(
              title: "Most Reviews",
              selected: selectedFilter ==
                  ProviderFilter.mostReviewed,
              onTap: () => notifier.changeFilter(
                  ProviderFilter.mostReviewed),
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------- CHIP ----------------
class _FilterChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),

          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),

          decoration: BoxDecoration(
            color: selected
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: Colors.black12,
            ),
          ),

          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selected
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}