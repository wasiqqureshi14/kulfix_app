import 'package:flutter/material.dart';
import 'package:kulfix/features/home/utils/service_icon_mapper.dart';

class ServiceCard extends StatelessWidget {
  final Map service;
  final VoidCallback? onTap;

  const ServiceCard({ super.key,
  required this.service,
  this.onTap,});

  @override
Widget build(BuildContext context) {
  final available = service['available'] == true;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric( horizontal: 14, vertical: 16 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 05,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
    
          /// ICON
          Icon(
  getServiceIcon(service['icon']),
            size: 58,
            color: Colors.black87,
          ),
    
          SizedBox(height: 14),
    
          /// TITLE
          Text(
            service['name'],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
    
          Text(
            "Services",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
    
          SizedBox(height: 14),
    
          /// STATUS BUTTON
          Align(
             alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                horizontal:14,
                vertical:9,
              ),
              decoration: BoxDecoration(
                color: available
                    ? Colors.green.withOpacity(.15)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  available ? "Available" : "Coming Soon",
                  style: TextStyle(
                    fontSize:12,
                    fontWeight: FontWeight.w600,
                    color: available ? Colors.green : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  }
}