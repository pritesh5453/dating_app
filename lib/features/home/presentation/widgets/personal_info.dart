import 'package:flutter/material.dart';

class Personal_info extends StatelessWidget {
  const   Personal_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     //zzz margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffF7F6F3),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: const [
          
          _Item(
            icon: Icons.cake_outlined,
            title: "Age",
            value: "21 years old",
            subtitle: "19 Feb 1999",
          ),
          _Divider(),

          _Item(
            icon: Icons.straighten,
            title: "Height",
            value: "5'5\" (165 cm)",
          ),
          _Divider(),

          _Item(
            icon: Icons.location_on_outlined,
            title: "Lives in",
            value: "Koregaon park",
            subtitle: "Pune, Maharashtra",
          ),
          _Divider(),

          _Item(
            icon: Icons.favorite_border,
            title: "Love language",
            value: "Compliment",
            subtitle: "Words of affirmation",
          ),
          _Divider(),

          _Item(
            icon: Icons.self_improvement_outlined,
            title: "Religion",
            value: "Hindu-Marathi",
          ),
          _Divider(),

          _Item(
            icon: Icons.people_outline,
            title: "Interested in",
            value: "Women - Dating",
          ),
          _Divider(),

          _Item(
            icon: Icons.wb_sunny_outlined,
            title: "Zodiac",
            value: "Scorpio",
            subtitle: "Loyal • Passionate • Intuitive",
          ),
          _Divider(),

          _Item(
            icon: Icons.translate_outlined,
            title: "Mother tongue",
            value: "Marathi",
          ),
          _Divider(),

          _Item(
            icon: Icons.phone_outlined,
            title: "Communication\nstyle",
            value: "Phone calls over\ntexts",
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? subtitle;
  final bool isLast;

  const _Item({
    required this.icon,
    required this.title,
    required this.value,
    this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18, 16, 18, isLast ? 20 : 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xffA83B63),
            size: 20,
          ),
          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff6A6A6A),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff222222),
                ),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 3),
                Text(
                  subtitle!,
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xff9C9C9C),
                  ),
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Divider(
        height: 1,
        thickness: 1,
        color: Color(0xffE5E3DF),
      ),
    );
  }
}