import 'package:flutter/material.dart';

class Work_profile extends StatelessWidget {
  const Work_profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "CAREER & AMBITION",
          style: TextStyle(
            color: Color(0xffC16A77),
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 11,
          ),
        ),
SizedBox(height: 10),
        Container(
         // margin: const EdgeInsets.symmetric(horizontal: 18),
          decoration: BoxDecoration(
            color: const Color(0xffF5F4F1),
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [

              _row(
                Icons.school_outlined,
                "Education",
                "NIFT Pune",
                "B.Des Fashion Design · 3rd year",
              ),

              _divider(),

              _row(
                Icons.work_outline,
                "Work as",
                "Fashion Design",
                "Freelance · 2 yrs exp",
              ),

              _divider(),

              _row(
                Icons.auto_awesome_outlined,
                "Work style",
                "Creative · Hybrid",
                "",
              ),

              _divider(),

              _row(
                Icons.trending_up,
                "Ambition level",
                "HIGHLY DRIVEN",
                "",
              ),

              const Divider(height: 1),

              Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [

                    Text(
                      "HER BIG DREAM",
                      style: TextStyle(
                        color: Color(0xffC16A77),
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                        fontSize: 11,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Launch her own sustainable Indian fashion label — handcrafted, slow fashion made with heart.\n\nAlso wants to travel every fashion capital before 30.",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.55,
                        color: Colors.black87,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Divider(height: 1),
    );
  }

  Widget _row(
    IconData icon,
    String title,
    String value,
    String subtitle,
  ) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Icon(
            icon,
            color: Color(0xffA54867),
            size: 20,
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
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
                ),
              ),

              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                )
            ],
          )
        ],
      ),
    );
  }
}