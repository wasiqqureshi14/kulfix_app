import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/services_category/data/category_repositry.dart';
import 'package:kulfix/features/services_category/models/service_giver_filter.dart';

final categoryRepoProvider =
    Provider((ref) => CategoryRepository());

class CategoryNotifier extends StateNotifier<
    AsyncValue<List<Map<String, dynamic>>>> {

  CategoryNotifier(this.ref, this.serviceId)
      : super(const AsyncValue.loading()) {
    loadProviders();
  }

  final Ref ref;
  final String serviceId;

  ProviderFilter get selectedFilter => currentFilter;
  ProviderFilter currentFilter = ProviderFilter.all;

  Future<void> loadProviders() async {
    try {
      final repo = ref.read(categoryRepoProvider);

      final data = await repo.fetchProviders(
        serviceId: serviceId,
        filter: currentFilter,
      );

      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  void changeFilter(ProviderFilter filter) {
    currentFilter = filter;
    loadProviders();
  }
}

final categoryProviders = StateNotifierProvider.family<
    CategoryNotifier,
    AsyncValue<List<Map<String, dynamic>>>,
    String>((ref, serviceId) {
  return CategoryNotifier(ref, serviceId);
});