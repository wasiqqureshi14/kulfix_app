/*import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/country_provider.dart';
import '../providers/phone_auth_provider.dart';

class CountryPickerSheet extends ConsumerStatefulWidget {
  const CountryPickerSheet({super.key});

  @override
  ConsumerState<CountryPickerSheet> createState() =>
      _CountryPickerSheetState();
}

class _CountryPickerSheetState
    extends ConsumerState<CountryPickerSheet> {

  String search = '';

  @override
  Widget build(BuildContext context) {

    final countriesAsync = ref.watch(countriesProvider);

    return SafeArea(
      child: Column(
        children: [

          /// SEARCH FIELD
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              onChanged: (v) => setState(() => search = v),
              decoration: InputDecoration(
                hintText: "Search country",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),

          /// COUNTRY LIST
          Expanded(
            child: countriesAsync.when(
              data: (countries) {

                final filtered = countries.where((c) =>
                    c.name.toLowerCase().contains(search.toLowerCase()) ||
                    c.dialCode.contains(search)).toList();

                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (_, i) {
                    final country = filtered[i];

                    return ListTile(
                      leading: Text(country.flag,
                          style: const TextStyle(fontSize: 22)),
                      title: Text(country.name),
                      trailing: Text(country.dialCode),
                      onTap: () {
                        ref
                            .read(phoneAuthProvider.notifier)
                            .selectCountry(country);
                        Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text(e.toString())),
            ),
          ),
        ],
      ),
    );
  }
}*/