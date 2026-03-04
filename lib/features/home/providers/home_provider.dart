import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/data/home_repositry.dart';

/// Repository provider
final homeRepositoryProvider =
    Provider<HomeRepository>((ref) {
  return HomeRepository();
});


/// Services provider
final servicesProvider =
    FutureProvider<List<Map<String, dynamic>>>((ref) async {

  final repo = ref.read(homeRepositoryProvider);

  return repo.getServices();
});