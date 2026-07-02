import 'package:flutter/material.dart';

class Intro_clip extends StatelessWidget {
  const Intro_clip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    //  margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          children: [
            /// Thumbnail
           SizedBox(
  height: 210,
  width: double.infinity,
  child: Image.network(
    "https://randomuser.me/api/portraits/men/32.jpg",
    fit: BoxFit.cover,
  ),
),

            /// Bottom Gradient
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 55,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black87, Colors.transparent],
                  ),
                ),
              ),
            ),

            /// Play Button
            Positioned(
              left: 0,
              right: 0,
              top: 50,
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.92),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 34,
                  color: Colors.black87,
                ),
              ),
            ),

            /// Duration
            const Positioned(
              left: 14,
              bottom: 12,
              child: Text(
                "Video intro • 0:28",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
