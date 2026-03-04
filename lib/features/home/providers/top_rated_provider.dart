import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/home/data/service_provider_repositry.dart';

final providersRepoProvider =
    Provider((ref) => ProvidersRepository());

class TopRatedNotifier
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {

  TopRatedNotifier(this.ref)
      : super(const AsyncValue.loading()) {
    loadInitial();
  }

  final Ref ref;

  int _offset = 0;
  final int _limit = 5;
  bool _hasMore = true;

  Future<void> loadInitial() async {
    try {
      final repo = ref.read(providersRepoProvider);

      final data =
          await repo.fetchTopRated(limit: _limit, offset: 0);

      _offset = data.length;

      state = AsyncValue.data(data);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadMore() async {
    if (!_hasMore) return;

    final current = state.value ?? [];

    final repo = ref.read(providersRepoProvider);

    final more = await repo.fetchTopRated(
      limit: _limit,
      offset: _offset,
    );

    if (more.isEmpty) {
      _hasMore = false;
      return;
    }

    _offset += more.length;

    state = AsyncValue.data([...current, ...more]);
  }
}

final topRatedProvider =
    StateNotifierProvider<TopRatedNotifier,
        AsyncValue<List<Map<String, dynamic>>>>(
  (ref) => TopRatedNotifier(ref),
);