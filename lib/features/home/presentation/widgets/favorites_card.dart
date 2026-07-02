import 'package:flutter/material.dart';

class favorites_card extends StatelessWidget {
  const favorites_card({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      decoration: BoxDecoration(
        color: const Color(0xffF6F5F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Heading
          const Text(
            "My simple pleasures...",
            style: TextStyle(
              fontSize: 10,
              color: Color(0xffC75A72),
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
            ),
          ),

          const SizedBox(height: 10),

          /// Description
          const Text(
            "Roadside chai after a long trek, no\nsignal, good company.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xff1E1E1E),
              height: 1.45,
            ),
          ),

          const SizedBox(height: 18),

          /// Gift Button
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.06),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Center(
              child: Image.asset(
                "assets/Icons/rose.png", // change to your image
                width: 25,
                height: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}