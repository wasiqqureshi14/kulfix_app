import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: const Color.fromARGB(179, 243, 243, 243),
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.black),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "Search services or providers...",
              style: TextStyle(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}