import 'package:flutter/material.dart';
import 'package:interview_assignment/features/home/presentation/screens/compliment_Ideas_screen.dart';


class OpinionCard extends StatelessWidget {
  const OpinionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
      },

      child: Container(
        width: double.infinity,
       // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        padding: const EdgeInsets.fromLTRB(18, 16, 18, 16),
        decoration: BoxDecoration(
          color: const Color(0xffF6F5F2),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            const Text(
              "The way to win me over is....",
              style: TextStyle(
                color: Color(0xffC65B73),
                fontSize: 10,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),

            const SizedBox(height: 10),

            /// Description
            const Text(
              "A good book rec and a strong chai opinion",
              style: TextStyle(
                color: Color(0xff1F1F1F),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1.45,
              ),
            ),

            const SizedBox(height: 22),

            /// Bottom Icon
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.local_florist,
                  size: 18,
                  color: Color(0xffD64063),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

