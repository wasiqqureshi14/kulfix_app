import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/auth/data/datasource/country_datasource.dart';
import 'package:kulfix/features/auth/data/models/country_model.dart';
import 'package:kulfix/features/auth/data/repository/country_repository.dart';

final countryRepositoryProvider = Provider(
  (ref) => CountryRepository(
    CountryRemoteDataSource(),
  ),
);

final countriesProvider =
    FutureProvider<List<CountryModel>>((ref) async {

  final repo = ref.read(countryRepositoryProvider);

  return repo.getCountries();
});