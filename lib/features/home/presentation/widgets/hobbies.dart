import 'package:flutter/material.dart';

class Hobbies extends StatelessWidget {
  const Hobbies({super.key});

  @override
  Widget build(BuildContext context) {
    final hobbies = [
      HobbyData(Icons.flight_takeoff_outlined, "Travel"),
      HobbyData(Icons.coffee_outlined, "Coffee"),
      HobbyData(Icons.terrain_outlined, "Trekking"),
      HobbyData(Icons.menu_book_outlined, "Books"),
      HobbyData(Icons.self_improvement_outlined, "Yoga"),
      HobbyData(Icons.music_note_outlined, "Indie music"),
      HobbyData(Icons.favorite_border, "Cooking"),
      HobbyData(Icons.photo_camera_outlined, "Photography"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "INTERESTS & HOBBIES",
          style: TextStyle(
            color: Color(0xffC45A74),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: hobbies.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.45,
          ),
          itemBuilder: (context, index) {
            return HobbyChip(data: hobbies[index]);
          },
        ),
      ],
    );
  }
}

class HobbyData {
  final IconData icon;
  final String title;

  HobbyData(this.icon, this.title);
}

class HobbyChip extends StatelessWidget {
  final HobbyData data;

  const HobbyChip({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            width: 26,
            height: 26,
            decoration: const BoxDecoration(
              color: Color(0xffFDECEF),
              shape: BoxShape.circle,
            ),
            child: Icon(
              data.icon,
              size: 15,
              color: Color(0xffC53D63),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Text(
              data.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          )
        ],
      ),
    );
  }
}