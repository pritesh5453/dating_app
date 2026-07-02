import 'package:flutter/material.dart';
import '../../model/home_model.dart';

class Member_card extends StatelessWidget {
  final HomeModel user;

  const Member_card({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(0, 8))],
      ),
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  user.picture,
                  width: 92,
                  height: 110,
                  fit: BoxFit.cover,
                ),
              ),
              if (user.isOnline)
                Container(
                  width: 16,
                  height: 16,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3CD36D),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        user.fullName,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Icon(Icons.favorite_border, color: Colors.black26),
                  ],
                ),
                const SizedBox(height: 6),
                Text('${user.age} years old', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                const SizedBox(height: 6),
                Text('${user.city}, ${user.country}', style: const TextStyle(color: Colors.black54, fontSize: 14)),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0F3FF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text('Message', style: TextStyle(color: Color(0xFF4E5AE8), fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEDEBFF),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Text('View', style: TextStyle(color: Color(0xFF4E5AE8), fontWeight: FontWeight.w600)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
