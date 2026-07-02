// swipe_card_deck.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:interview_assignment/core/utils/bottom_box.dart';
import '../../model/home_model.dart';

const Color kAccentPink = Color(0xFFE94873);

class ProfileCardData {
  final String name;
  final int age;
  final String imageUrl;
  final String city;
  final String distance;
  final String profession;
  final String height;
  final String relationshipType;
  final int matchPercent;
  final int trustPercent;
  final String replyTime;
  final bool verified;

  const ProfileCardData({
    required this.name,
    required this.age,
    required this.imageUrl,
    required this.city,
    required this.distance,
    required this.profession,
    required this.height,
    required this.relationshipType,
    required this.matchPercent,
    required this.trustPercent,
    required this.replyTime,
    this.verified = false,
  });

  factory ProfileCardData.fromUser(HomeModel user) {
    return ProfileCardData(
      name: user.fullName,
      age: user.age,
      imageUrl: user.picture,
      city: user.city,
      distance: user.country, // adjust as needed
      profession: 'Content Creator',
      height: '',
      relationshipType: 'Serious relationship',
      matchPercent: 77,
      trustPercent: 98,
      replyTime: '~5m Reply',
      verified: user.isOnline,
    );
  }
}

// ---------------------------------------------------------------------
// Main swipe deck widget
// ---------------------------------------------------------------------
class Swipe_match extends StatefulWidget {
  final List<HomeModel> users;
  final ValueChanged<int> onIndexChanged; // corrected type

  const Swipe_match({
    super.key,
    required this.users,
    required this.onIndexChanged,
  });

  @override
  State<Swipe_match> createState() => _Swipe_matchState();
}

class _Swipe_matchState extends State<Swipe_match> {
  final CardSwiperController _controller = CardSwiperController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Called when a card is swiped away
  bool _onSwipe(int previousIndex, int? currentIndex, CardSwiperDirection direction) {
    if (currentIndex != null && currentIndex < widget.users.length) {
      widget.onIndexChanged(currentIndex);
    }
    return true; // allow the swipe
  }

  // Called when the rose button is tapped
  void _onLikeTap() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const ComplimentBottomSheet(),
    );
  }

  // Undo the last swipe
  void _onUndoTap() {
    _controller.undo();
    // After undo, the previous card is back on top.
    // We don't update the parent index here because it's not necessary.
  }

  @override
  Widget build(BuildContext context) {
    final cards = widget.users.map(ProfileCardData.fromUser).toList();

    if (cards.isEmpty) {
      return const Center(
        child: Text(
          'No more profiles 🙈',
          style: TextStyle(color: Colors.black54, fontSize: 16),
        ),
      );
    }

    return Stack(
      children: [
        CardSwiper(
          controller: _controller,
          cardsCount: cards.length,
          onSwipe: _onSwipe,
          isLoop: true, // loops when you reach the end
          numberOfCardsDisplayed: cards.length < 3 ? cards.length : 3,
          threshold: 60,
          padding: EdgeInsets.zero,
          duration: const Duration(milliseconds: 400),
          cardBuilder: (context, index, percentX, percentY) {
            final profile = cards[index];

            return GestureDetector(
              onTap: () {
                // Tap opens the same bottom sheet as the rose button
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (_) => const ComplimentBottomSheet(),
                );
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // --- Profile card itself ---
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: _ProfileCard(
                      data: profile,
                      onUndoTap: _onUndoTap,
                    ),
                  ),
                  // --- LIKE stamp (appears when swiping right) ---
                  if (percentX > 0.3)
                    Positioned(
                      top: 40,
                      left: 30,
                      child: Transform.rotate(
                        angle: -0.2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green, width: 4),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.green.withOpacity(0.1),
                          ),
                          child: const Text(
                            'LIKE',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                  // --- NOPE stamp (appears when swiping left) ---
                  if (percentX < -0.3)
                    Positioned(
                      top: 40,
                      right: 30,
                      child: Transform.rotate(
                        angle: 0.2,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 4),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.red.withOpacity(0.1),
                          ),
                          child: const Text(
                            'NOPE',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        // Floating rose button at bottom‑right
        Positioned(
          right: 8,
          bottom: 8,
          child: GestureDetector(
            onTap: _onLikeTap,
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Center(
                child: Text('🌹', style: TextStyle(fontSize: 26)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------
// Individual profile card UI (no swipe logic)
// ---------------------------------------------------------------------
class _ProfileCard extends StatelessWidget {
  final ProfileCardData data;
  final VoidCallback onUndoTap;

  const _ProfileCard({
    required this.data,
    required this.onUndoTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // --- Background image ---
        Image.network(
          data.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: Colors.grey.shade800,
            child: const Icon(Icons.person, size: 100, color: Colors.white54),
          ),
        ),
        // --- Gradient overlay for better text visibility ---
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                stops: const [0.5, 1.0],
              ),
            ),
          ),
        ),
        // --- Top‑left undo button ---
        Positioned(
          top: 16,
          left: 16,
          child: _circleIconButton(Icons.replay, onUndoTap),
        ),
        // --- Top‑right more button ---
        Positioned(
          top: 16,
          right: 16,
          child: _circleIconButton(Icons.more_vert, () {}),
        ),
        // --- Bottom info ---
        Positioned(
          left: 20,
          right: 20,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Badge row
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _badge(Icons.circle, kAccentPink, '${data.matchPercent}% Match'),
                  _badge(Icons.circle, Colors.greenAccent, '${data.trustPercent}% Trust'),
                  _badge(Icons.circle, Colors.orangeAccent, data.replyTime),
                ],
              ),
              const SizedBox(height: 12),
              // Name and age
              Text(
                '${data.name} ${data.age}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Location
              _infoRow(Icons.location_on_outlined, '${data.city}, ${data.distance}'),
              const SizedBox(height: 4),
              // Profession / height
              _infoRow(
                Icons.work_outline,
                data.height.isEmpty ? data.profession : '${data.profession} · ${data.height}',
              ),
              const SizedBox(height: 4),
              // Relationship type
              _infoRow(Icons.favorite_border, data.relationshipType),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleIconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.black, size: 18),
      ),
    );
  }

  Widget _badge(IconData dotIcon, Color dotColor, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(dotIcon, color: dotColor, size: 8),
          const SizedBox(width: 6),
          Text(text, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white70, size: 14),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 13)),
      ],
    );
  }
}