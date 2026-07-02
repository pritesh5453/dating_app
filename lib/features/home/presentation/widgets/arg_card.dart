import 'package:flutter/material.dart';
import 'package:interview_assignment/features/home/presentation/screens/compliment_Ideas_screen.dart';


class ArgCard extends StatelessWidget {
  const ArgCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const ComplimentBottomSheet(),
        );
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
              "We'll get along if...",
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
              "You can debate me for an hour and\nstill want dessert after.",
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

class ComplimentBottomSheet extends StatefulWidget {
  const ComplimentBottomSheet({super.key});

  @override
  State<ComplimentBottomSheet> createState() => _ComplimentBottomSheetState();
}

class _ComplimentBottomSheetState extends State<ComplimentBottomSheet> {
  final controller = TextEditingController();
  bool _likeSelected = false;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    final hasText = controller.text.trim().isNotEmpty;

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomInset),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xffF7F6F3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 45,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            const SizedBox(height: 18),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "COMPLIMENTING",
                style: TextStyle(
                  fontSize: 10,
                  letterSpacing: 2,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Prompt",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Image.asset("assets/Icons/caption_icon.png", width: 18, height: 18),

                SizedBox(width: 4),

                Text("3 comments"),

                Spacer(),

                Image.asset("assets/Icons/rose.png", width: 18, height: 18),

                SizedBox(width: 4),

                Text("2 roses"),

                Spacer(),

                Icon(Icons.monetization_on, color: Colors.amber, size: 18),

                SizedBox(width: 4),

                Text("5,258 balance"),
              ],
            ),

            const SizedBox(height: 18),

            SizedBox(
              height: 110,
              child: Stack(
                children: [
                  TextField(
                    controller: controller,
                    maxLines: 4,
                    onChanged: (_) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: "Write a sweet compliment...",
                      hintStyle: const TextStyle(
                        color: Color(0xff8C8C8C),
                        fontSize: 14,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 50),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0xffE2E2E2)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0xffE2E2E2)),
                      ),
                    ),
                  ),

                  /// Try Button
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: InkWell(
                      onTap: () async {
                        final selected = await Navigator.push<String?>(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ComplimentIdeasScreen(),
                          ),
                        );

                        if (selected != null && selected.isNotEmpty) {
                          controller.text = selected;
                          setState(() {});
                        }
                      },
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF5D8),
                          border: Border.all(color: const Color(0xffEBC7D0)),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/Icons/idea_icon.png", // bulb image
                              width: 14,
                              height: 14,
                            ),
                            const SizedBox(width: 4),
                            const Text(
                              "Try",
                              style: TextStyle(
                                color: Color(0xffC85A73),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      setState(() {
                        _likeSelected = !_likeSelected;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        color: _likeSelected ? const Color(0xffC85A73) : const Color(0xFFD9D9D9),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Icons/rose.png",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Rose",
                          style: TextStyle(
                            color: _likeSelected ? const Color(0xffC85A73) : Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          width: 18,
                          height: 18,
                          decoration: BoxDecoration(
                            color: _likeSelected ? const Color(0xffC85A73) : const Color(0xFFBDBDBD),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(color: Color(0xFFD9D9D9)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Icons/reward_box.png",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Select Gift",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${controller.text.length}/140',
                style: const TextStyle(color: Colors.black54),
              ),
            ),

            const SizedBox(height: 18),

            Row(
              children: [
                Container(
                  width: 70,
                  height: 55,
                  decoration: BoxDecoration(
                    color: const Color(0xffF7F6F3),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xffC85A73),
                      width: 1,
                    ),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.favorite,
                          color: Color(0xffC85A73),
                          size: 16,
                        ),
                        SizedBox(height: 2),
                        Text(
                          "Like",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffC85A73),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: ElevatedButton(
                      onPressed: hasText
                          ? () {
                              controller.clear();
                              setState(() {});
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  const SnackBar(
                                    content: Text('Compliment sent successfully!'),
                                  ),
                                );
                              Navigator.of(context).pop();
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: hasText ? const Color(0xffC85A73) : const Color(0xffD9D9D9),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Send Compliment",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

