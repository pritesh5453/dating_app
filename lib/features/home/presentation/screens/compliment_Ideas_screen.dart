import 'dart:async';
import 'package:flutter/material.dart';

const Color kAccentPink = Color(0xFFE94873);


class ComplimentIdeasScreen extends StatefulWidget {
  const ComplimentIdeasScreen({super.key});

  @override
  State<ComplimentIdeasScreen> createState() => _ComplimentIdeasScreenState();
}

class _ComplimentIdeasScreenState extends State<ComplimentIdeasScreen> {

  // BUG FIX: every category only had 3 short-and-mismatched lines. The
  // video shows each category (Sweet / Playful / Admiring / Flirty / Fun)
  // with a full 6-item list. Sweet, Admiring and Flirty below are the exact
  // copy captured from the video. Playful and Fun were never opened on
  // screen during the recording, so their lines are written to match the
  // tone of the rest — swap them for the real copy if you have it.
  static const Map<String, List<String>> _complimentsByCategory = {
    'Sweet': [
      'Your smile is absolutely contagious 😊',
      'You have the kind of warmth that makes people feel at home.',
      'There\'s something genuinely lovely about your energy.',
      'I could probably talk to you for hours and never get bored.',
      'You seem like the kind of person who makes ordinary days better.',
      'Your kindness really comes through in your profile.',
    ],
    'Playful': [
      'Careful, that grin is doing a lot of damage to my focus.',
      'I feel like you\'d win every game night, and I respect that.',
      'You look like trouble I\'d actually enjoy.',
      'Pretty sure you\'re the reason people invented "just one more swipe."',
      'You\'ve got main-character energy and I\'m here for it.',
      'I have a feeling you\'re a lot more fun than you\'re letting on.',
    ],
    'Admiring': [
      'I really admire how driven you seem about your work.',
      'Your ambition is honestly inspiring.',
      'It\'s rare to see someone so genuine in how they present themselves.',
      'You clearly have a great eye for the things you love.',
      'The way you talk about your passions is really attractive.',
      'I respect someone who knows exactly what they want.',
    ],
    'Flirty': [
      'Not gonna lie, your smile stopped my scroll 😍',
      'You\'re trouble, I can already tell — the good kind.',
      'If you\'re as fun in person as your profile, I\'m in.',
      'I think we\'d make a dangerously good team 💌🍷',
      'You\'ve got a vibe I can\'t quite look away from.',
      'Coffee, you, and good conversation — when\'s good for you?',
    ],
    'Fun': [
      'Quick question: are you as fun as your photos suggest?',
      'I\'d bet you tell great stories. Prove me right?',
      'You look like the friend who makes every plan better.',
      'Betting you have the best playlist out of anyone I\'ve matched with.',
      'You seem like a "say yes to spontaneous plans" kind of person.',
      'I\'d challenge you to trivia night, but I like winning.',
    ],
  };

  String _selectedCategory = 'Flirty';
  int _selectedIndex = 2;

  // BUG FIX: tapping a compliment card had no feedback other than the
  // border/checkmark. The video shows a small "Compliment added ✨" pill
  // that fades in above the button for a moment after a selection.
  bool _showAddedToast = false;
  Timer? _toastTimer;

  List<String> get _currentCompliments =>
      _complimentsByCategory[_selectedCategory] ?? const [];

  void _selectCompliment(int index) {
    setState(() {
      _selectedIndex = index;
      _showAddedToast = true;
    });
    _toastTimer?.cancel();
    _toastTimer = Timer(const Duration(milliseconds: 1400), () {
      if (mounted) setState(() => _showAddedToast = false);
    });
  }

  @override
  void dispose() {
    _toastTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFF6DCE6),
                    Color(0xFFEDE3F0),
                    Color(0xFFF3F1F6),
                  ],
                  stops: [0.0, 0.35, 1.0],
                ),
              ),
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  _buildTopBar(context),
                  _buildHeaderIcon(),
                  const SizedBox(height: 16),
                  const Text(
                    'Compliment Ideas',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'pick one to make a great first impression',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: const Color(0xFFF7F7F7),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      _buildCategoryChips(),
                      const SizedBox(height: 16),
                      _buildComplimentList(),
                      // BUG FIX: this was missing — it's the fading
                      // "Compliment added ✨" confirmation seen in the video.
                      _buildAddedToast(),
                    ],
                  ),
                ),
              ),
            ),
            _buildUseButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Container(
      
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).maybePop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.chevron_left, color: Colors.black87, size: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: 72,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(72, 56),
              painter: _BubblePainter(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                  (i) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final categories = _complimentsByCategory.keys.toList();
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = category == _selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedCategory = category;
                _selectedIndex = 0;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: isSelected ? kAccentPink : Colors.white.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildComplimentList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: List.generate(_currentCompliments.length, (index) {
          final isSelected = index == _selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: GestureDetector(
              onTap: () => _selectCompliment(index),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  // BUG FIX: 0.4 opacity painted a strong solid-pink card;
                  // the video shows only a faint pink tint behind selected
                  // items, so this is dropped down to 0.08.
                  color: isSelected ? kAccentPink.withOpacity(0.08) : Colors.transparent,

                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: isSelected ? kAccentPink : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _currentCompliments[index],
                        style: const TextStyle(
                          fontSize: 14.5,
                          height: 1.4,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: kAccentPink,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.check, color: Colors.white, size: 14),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildAddedToast() {
    return AnimatedOpacity(
      opacity: _showAddedToast ? 1 : 0,
      duration: const Duration(milliseconds: 200),
      child: AnimatedSlide(
        offset: _showAddedToast ? Offset.zero : const Offset(0, 0.3),
        duration: const Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.only(top: 4, bottom: 8),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'Compliment added ✨',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUseButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: ElevatedButton(
          onPressed: _currentCompliments.isEmpty
              ? null
              : () => Navigator.of(context).pop(_currentCompliments[_selectedIndex]),
          style: ElevatedButton.styleFrom(
            backgroundColor: kAccentPink,
            foregroundColor: Colors.white,
            elevation: 4,
            shadowColor: kAccentPink.withOpacity(0.5),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
          child: const Text(
            'Use this compliment',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}

class _BubblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height - 12),
      const Radius.circular(20),
    );

    final path = Path()..addRRect(bodyRect);

    // pointer tail at bottom-center
    final tail = Path()
      ..moveTo(size.width * 0.42, size.height - 13)
      ..lineTo(size.width * 0.5, size.height)
      ..lineTo(size.width * 0.58, size.height - 13)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(tail, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}