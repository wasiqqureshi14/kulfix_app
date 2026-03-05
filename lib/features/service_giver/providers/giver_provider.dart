import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:kulfix/features/service_giver/data/giver_detail_repositry.dart';

final providerDetailsRepoProvider =
    Provider((ref) => ProviderDetailsRepository());

class ProviderDetailsNotifier
    extends StateNotifier<AsyncValue<Map<String, dynamic>>> {

  ProviderDetailsNotifier(this.ref, this.providerId)
      : super(const AsyncValue.loading()) {
    loadProvider();
  }

  final Ref ref;
  final String providerId;

  Future<void> loadProvider() async {
    try {

      final repo = ref.read(providerDetailsRepoProvider);

      final provider =
          await repo.fetchProviderDetails(providerId);

      state = AsyncValue.data(provider);

    } catch (e, st) {

      state = AsyncValue.error(e, st);

    }
  }
}

final providerDetailsProvider =
    StateNotifierProvider.family<
        ProviderDetailsNotifier,
        AsyncValue<Map<String, dynamic>>,
        String>((ref, providerId) {

  return ProviderDetailsNotifier(ref, providerId);
});