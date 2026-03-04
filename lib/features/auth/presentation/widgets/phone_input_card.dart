import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/phone_auth_provider.dart';
import '../providers/country_provider.dart';

class PhoneInputCard extends ConsumerWidget {
  const PhoneInputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final state = ref.watch(phoneAuthProvider);
    final notifier = ref.read(phoneAuthProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                    ),
                  ],
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                  "PHONE NUMBER",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.grey.shade700,
                  ),
                ),

              Row(
                children: [
                  GestureDetector(
                    onTap: notifier.toggleDropdown,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xffF1F3F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(state.selectedCountry.flag),
                          const SizedBox(width: 6),
                          Text(
                            state.selectedCountry.dialCode,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
              
                  const SizedBox(width: 12),
              
                  
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      onChanged: notifier.updatePhone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffF1F3F6),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                           borderSide: BorderSide(
                              color: Colors.black,
                              width: 1.5, 
                            ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

       
        if (state.showDropdown)
           ref.watch(countriesProvider).when(
            data: (countries) {

              final filtered = countries.where((c) =>
                  c.name.toLowerCase()
                      .contains(state.search.toLowerCase()) ||
                  c.dialCode.contains(state.search)).toList();

              return Container(
                margin: const EdgeInsets.only(top: 8),
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [

                    /// SEARCH FIELD
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        onChanged: notifier.updateSearch,
                        decoration: InputDecoration(
                          prefixIcon:
                              const Icon(Icons.search),
                          hintText: "Search country",
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),

                    /// COUNTRY LIST
                    Expanded(
                      child: ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (_, i) {
                          final country = filtered[i];

                          return ListTile(
                            leading: Text(country.flag),
                            title: Text(country.name),
                            trailing:
                                Text(country.dialCode),
                            onTap: () {
                              notifier.selectCountry(country);
                              notifier.closeDropdown();
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(20),
              child: Center(
                child:  SizedBox.shrink(),
              ),
            ),
            error: (e, _) =>
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(e.toString()),
                ),
          ),
      ],
    );
  }
}