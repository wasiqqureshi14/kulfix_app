import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/providers/greeting_provider.dart';
import 'package:kulfix/features/home/providers/user_name_provider.dart';
import 'package:kulfix/features/home/widgets/saerch_bar.dart';


class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});
@override
Widget build(BuildContext context, WidgetRef ref) {

  final greeting = ref.watch(greetingProvider);
  final userAsync = ref.watch(userNameProvider);

  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  greeting,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),

                SizedBox(height:6),

                userAsync.when(

                  loading: () => Text(
                    "User",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  error: (_, __) => Text(
                    "User",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  data: (name) => Text(
                    name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: const Icon(
                Icons.notifications,
                color: Colors.black87,
              ),
            )
          ],
        ),

        SizedBox(height: 20),

        const SearchBarWidget(),
      ],
    ),
  );
}
}