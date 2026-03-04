import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/profile_provider.dart';

class LanguageSelector extends ConsumerWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final selected = ref.watch(profileProvider).language;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xffF5F6F8),
        borderRadius: BorderRadius.circular(18),
        
      ),
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            const Text(
            "Language",  
          ),

          const SizedBox(height: 15),
          Row(
            children: languages.map((lang) {
              final isSelected = selected == lang["code"];
          
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.read(profileProvider.notifier)
                        .setLanguage(lang["code"]!);
                  },
                  child: Container(
                    height: 52,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected
                            ? Colors.black
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(lang["name"]!),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

const languages = [
  {"code": "en", "name": "English"},
  {"code": "ar", "name": "العربية"},
];