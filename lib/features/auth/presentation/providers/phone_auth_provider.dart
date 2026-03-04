import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/country_model.dart';

class PhoneAuthState {
  final String phone;
  final CountryModel selectedCountry;
  final bool showDropdown;
  final String search;

  const PhoneAuthState({
    required this.selectedCountry,
    this.phone = '',
    this.showDropdown = false,
    this.search = '',
  });

  PhoneAuthState copyWith({
    String? phone,
    CountryModel? selectedCountry,
    bool? showDropdown,
    String? search,
  }) {
    return PhoneAuthState(
      phone: phone ?? this.phone,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      showDropdown: showDropdown ?? this.showDropdown,
      search: search ?? this.search,
    );
  }

  bool get isValid =>
      phone.replaceAll(' ', '').length >= 6;
}

final phoneAuthProvider =
    NotifierProvider<PhoneAuthNotifier, PhoneAuthState>(
        PhoneAuthNotifier.new);

class PhoneAuthNotifier extends Notifier<PhoneAuthState> {

  /// Default country = Qatar
  @override
  PhoneAuthState build() {
    return const PhoneAuthState(
      selectedCountry: CountryModel(
        name: "Qatar",
        code: "QA",
        dialCode: "+974",
        flag: "🇶🇦",
      ),
    );
  }

  void updatePhone(String value) {
    state = state.copyWith(phone: value);
  }

  void selectCountry(CountryModel country) {
    state = state.copyWith(selectedCountry: country);
  }

  void toggleDropdown() {
    state =
        state.copyWith(showDropdown: !state.showDropdown);
  }

  void closeDropdown() {
    state = state.copyWith(showDropdown: false);
  }

  void updateSearch(String value) {
    state = state.copyWith(search: value);
  }
}