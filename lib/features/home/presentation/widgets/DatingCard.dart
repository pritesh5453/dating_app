import 'package:flutter/material.dart';

class DatingCard extends StatelessWidget {
  const DatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFB54E6A),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [

          Text(
            "DATING GOAL",
            style: TextStyle(
              color: Color(0xFFF6D7E1),
              fontSize: 10,
              letterSpacing: 2,
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 10),

          Text(
            "Long-term, marriage-open",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),

          SizedBox(height: 12),

          Text(
            "No pressure, no timelines — just looking for the\nright person to build something real with.",
            style: TextStyle(
              color: Color(0xFFF7E5EB),
              fontSize: 15,
              height: 1.45,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}