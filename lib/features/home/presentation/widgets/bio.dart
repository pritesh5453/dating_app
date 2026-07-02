import 'package:flutter/material.dart';

class Bio extends StatelessWidget {
  const Bio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xffEAEAEA)),
          bottom: BorderSide(color: Color(0xffEAEAEA)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Chips
          Row(
            children: [
              _chip("92% Match", Colors.blue),
              const SizedBox(width: 10),
              _chip("98% Trust", Colors.green),
              const SizedBox(width: 10),
              _chip("~5m Replies", Colors.orange),
            ],
          ),

          const SizedBox(height: 24),

          /// About Title
          const Text(
            "ABOUT",
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
              color: Color(0xffD65B66),
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "Building products by day, planning my next trek by night. Looking for someone equally driven and equally curious.",
            style: TextStyle(
              fontSize: 16,
              height: 1.6,
              color: Color(0xff222222),
            ),
          ),

          const SizedBox(height: 25),

          Align(
  alignment: Alignment.bottomRight,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: const Color(0xFFFFF8F8),
      shape: BoxShape.circle,
      border: Border.all(
        color: const Color(0xFFF2D5DD),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Center(
      child: Image.asset(
        "assets/Icons/rose.png",
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    ),
  ),
),
        ],
      ),
    );
  }

  Widget _chip(String text, Color dotColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 3,
            backgroundColor: dotColor,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}