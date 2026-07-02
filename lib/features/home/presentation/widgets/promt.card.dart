import 'package:flutter/material.dart';

class PromptCard extends StatelessWidget {
  const PromptCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     // margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xffF5F4F1),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Text(
            "The way to win me over is...",
            style: TextStyle(
              color: Color(0xffC16A77),
              fontSize: 11,
              letterSpacing: 1.3,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            "A good book rec and a strong chai opinion.",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 1.35,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 24),

          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(21),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                )
              ],
            ),
            child: const Center(
              child: Text(
                "🎁",
                style: TextStyle(fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}