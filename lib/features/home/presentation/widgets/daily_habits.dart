import 'package:flutter/material.dart';

class DailyHabitsCard extends StatelessWidget {
  const DailyHabitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "LIFESTYLE",
          style: TextStyle(
            fontSize: 11,
            letterSpacing: 2,
            color: Color(0xffC55A73),
            fontWeight: FontWeight.w700,
          ),
        ),
SizedBox(height: 10),


        Container(
        //  margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xffF6F5F2),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: const [

              LifestyleTile(
                icon: Icons.restaurant_menu,
                title: "Diet",
                value: "Vegetarian",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.wine_bar_outlined,
                title: "Drinking",
                value: "Socially",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.smoking_rooms_outlined,
                title: "Smoking",
                value: "Non-smoker",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.fitness_center_outlined,
                title: "Fitness",
                value: "Gym 4x/week",
                subtitle: "Yoga • Trekking",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.location_on_outlined,
                title: "Travel",
                value: "4–5 trips/year",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.pets_outlined,
                title: "Pets",
                value: "Cat parent",
              ),

              LifestyleDivider(),

              LifestyleTile(
                icon: Icons.nightlight_round,
                title: "Sleep",
                value: "Night Owl",
                isLast: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class LifestyleTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? subtitle;
  final bool isLast;

  const LifestyleTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.subtitle,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        18,
        16,
        18,
        isLast ? 18 : 16,
      ),
      child: Row(
        children: [

          Icon(
            icon,
            color: const Color(0xffA54263),
            size: 20,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xff6D6D6D),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Color(0xff222222),
                ),
              ),

              if (subtitle != null)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    subtitle!,
                    style: const TextStyle(
                      color: Color(0xff999999),
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class LifestyleDivider extends StatelessWidget {
  const LifestyleDivider({super.key});

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