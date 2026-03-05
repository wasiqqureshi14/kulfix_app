import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/services_category/data/category_repositry.dart';
import 'package:kulfix/features/services_category/models/service_giver_filter.dart';

final categoryRepoProvider =
    Provider((ref) => CategoryRepository());

class CategoryState {
  final List<Map<String, dynamic>> providers;
  final ProviderFilter selectedFilter;
  final bool isLoading;

  const CategoryState({
    this.providers = const [],
    this.selectedFilter = ProviderFilter.all,
    this.isLoading = true,
  });

  CategoryState copyWith({
    List<Map<String, dynamic>>? providers,
    ProviderFilter? selectedFilter,
    bool? isLoading,
  }) {
    return CategoryState(
      providers: providers ?? this.providers,
      selectedFilter: selectedFilter ?? this.selectedFilter,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class CategoryNotifier
    extends StateNotifier<CategoryState> {

  CategoryNotifier(this.ref, this.serviceId)
      : super(const CategoryState()) {
    loadProviders();
  }

  final Ref ref;
  final String serviceId;

  Future<void> loadProviders() async {

    state = state.copyWith(isLoading: true);

    final repo = ref.read(categoryRepoProvider);

    final data = await repo.fetchProviders(
      serviceId: serviceId,
      filter: state.selectedFilter,
    );

    state = state.copyWith(
      providers: data,
      isLoading: false,
    );
  }

  void changeFilter(ProviderFilter filter) {

    state = state.copyWith(
      selectedFilter: filter,
    );

    loadProviders();
  }
}

final categoryProviders =
    StateNotifierProvider.family<
        CategoryNotifier,
        CategoryState,
        String>((ref, serviceId) {

  return CategoryNotifier(ref, serviceId);
});