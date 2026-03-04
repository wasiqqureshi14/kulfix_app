import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/country_model.dart';

class CountryRemoteDataSource {

  final SupabaseClient client =
      Supabase.instance.client;

  Future<List<CountryModel>> fetchCountries() async {

    final response =
        await client.from('countries').select();

    final countries = response.map<CountryModel>((e) {

      return CountryModel(
        name: e['name'],
        code: e['code'],
        dialCode: e['dial_code'],
        flag: e['flag'],
      );

    }).toList();

    return countries;
  }
}