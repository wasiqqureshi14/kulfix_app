import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kulfix/features/home/widgets/saerch_bar.dart';
import 'package:kulfix/core/services/supabase_services.dart';

class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  /// Dynamic greeting based on device time
  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  /// Fetch profile name from Supabase
  Future<String> _fetchUserName() async {
    final user = supabase.auth.currentUser;

    if (user == null) return "User";

    final response = await supabase
        .from('user_profiles')
        .select('full_name')
        .eq('id', user.id)
        .single();

    return response['full_name'] ?? "User";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20),
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              /// LEFT SIDE TEXTS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Greeting
                  Text(
                    _getGreeting(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),

                  SizedBox(height:6),

                  /// Username (loads silently in background)
                  FutureBuilder<String>(
                    future: _fetchUserName(),
                    builder: (context, snapshot) {

                      final name =
                          snapshot.data ?? "User";

                      return Text(
                        "$name ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                ],
              ),

              /// Notification Icon
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