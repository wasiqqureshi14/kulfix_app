import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PreferenceCard extends StatelessWidget {
  final String title;
  final String subtitle;
   final String imagePath;
  final VoidCallback? onPressed;
  final bool isButtonDisabled;

  const PreferenceCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.onPressed,
    required this.isButtonDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: BoxBorder.all(color: Colors.black)
      ),
      child: Column(
        children: [

          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 6),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize:13,
              color: Colors.black54,
            ),
          ),

          SizedBox(height: 20),

          SvgPicture.asset(
            imagePath,
            height: 100,
            fit: BoxFit.contain,
          ),
Align(
  alignment: Alignment.center,
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor:
          isButtonDisabled ? Colors.grey.shade400 : Colors.black,
      padding: EdgeInsets.symmetric(
        horizontal: 50,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    onPressed: isButtonDisabled ? null : onPressed,
    child: Text(
      isButtonDisabled ? "Coming Soon" : "Select",
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  ),
),
        ],
      ),
    );
  }
}