import 'package:kulfix/features/auth/data/datasource/country_datasource.dart';
import 'package:kulfix/features/auth/data/models/country_model.dart';

class CountryRepository {
  final CountryRemoteDataSource remote;

  CountryRepository(this.remote);

  Future<List<CountryModel>> getCountries() async {
    final countries = await remote.fetchCountries();

    countries.sort((a, b) {
      if (a.code == "QA") return -1;
      if (b.code == "QA") return 1;
      return a.name.compareTo(b.name);
    });

    return countries;
  }
}