
import 'package:flutter_riverpod/legacy.dart';

enum CleaningType { single, team }

class CleaningPreferenceState {
  final CleaningType? selectedType;

  const CleaningPreferenceState({this.selectedType});

  CleaningPreferenceState copyWith({
    CleaningType? selectedType,
  }) {
    return CleaningPreferenceState(
      selectedType: selectedType ?? this.selectedType,
    );
  }
}

class CleaningPreferenceNotifier
    extends StateNotifier<CleaningPreferenceState> {
  CleaningPreferenceNotifier()
      : super(const CleaningPreferenceState());

  void selectType(CleaningType type) {
    state = state.copyWith(selectedType: type);
  }
}

final cleaningPreferenceProvider =
    StateNotifierProvider<CleaningPreferenceNotifier,
        CleaningPreferenceState>((ref) {
  return CleaningPreferenceNotifier();
});