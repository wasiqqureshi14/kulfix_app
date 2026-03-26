import 'package:flutter/material.dart';

class SuccessIcon extends StatelessWidget {

  const SuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 90,
      width: 90,
      decoration: const BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
      ),

      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}