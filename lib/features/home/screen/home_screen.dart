import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/widgets/service_giver/top_rated_section.dart';
import '../widgets/home_header.dart';
import '../widgets/offer_banner.dart';
import '../widgets/service_cards/service_grid.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
        backgroundColor:  Colors.white,
        body: SafeArea(
          child:  CustomScrollView(
                slivers: [
      
                  const SliverToBoxAdapter(
                    child: HomeHeader(),
                  ),
      
                const  SliverToBoxAdapter(
                    child: ServiceGrid(),
                  ),
      
                  const SliverToBoxAdapter(
                    child: OfferBanner(),
                  ),
      
                  const SliverToBoxAdapter(
                  child: TopRatedSection(),
                ),
                ],
              )
        ),
      
    );
  }
}