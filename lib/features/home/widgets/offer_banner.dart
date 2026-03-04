import 'package:flutter/material.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:10), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("First Booking Offer! 🎉",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold)),
             
              Text("Get 20% off your first cleaning.",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize:10)),
            ],
          ),
        ),
      ),
    );
  }
}