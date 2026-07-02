// 📁 chat_screen.dart
// Contains: ChatPartner, NewMatch, ChatItem, and ChatScreen (full UI)

import 'dart:ui';
import 'package:flutter/material.dart';

// ---------- CONSTANTS ----------
const Color kAccentPink = Color(0xFFE94873);
const Color kScreenBg = Color(0xFFF8F7FB);

// ---------- MODELS ----------

/// Model for a single chat partner (used inside ChatScreen)
class ChatPartner {
  final String name;
  final String avatarUrl;
  final bool isOnline;
  final bool isPlatinum;
  final int relationshipLevel;
  final double relationshipProgress; // 0.0 - 1.0

  const ChatPartner({
    required this.name,
    required this.avatarUrl,
    this.isOnline = false,
    this.isPlatinum = false,
    this.relationshipLevel = 1,
    this.relationshipProgress = 0.0,
  });
}

/// Model for a new match (used in match list)
class NewMatch {
  final String name;
  final Color color;
  final String imageUrl;
  final bool isNew;
  final IconData? badgeIcon;
  final Color? badgeColor;

  NewMatch(
    this.name,
    this.color,
    this.imageUrl, {
    this.isNew = false,
    this.badgeIcon,
    this.badgeColor,
  });
}

/// Model for a chat item in the chat list
class ChatItem {
  final String name;
  final int age;
  final Color avatarColor;
  final String imageUrl;
  final int matchPercent;
  final String preview;
  final String time;
  final bool online;
  final double progress; // 0..1
  final String progressLabel;
  final bool isTyping;
  final int? unreadCount;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  final Color progressColor;

  ChatItem({
    required this.name,
    required this.age,
    required this.avatarColor,
    required this.imageUrl,
    required this.matchPercent,
    required this.preview,
    required this.time,
    required this.online,
    required this.progress,
    required this.progressLabel,
    this.isTyping = false,
    this.unreadCount,
    this.trailingIcon,
    this.trailingIconColor,
    this.progressColor = const Color(0xFFE94F80),
  });
}

// ---------- CHAT SCREEN (Full UI) ----------

class ChatScreen extends StatefulWidget {
  final ChatPartner partner;
  const ChatScreen({super.key, required this.partner});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  String _selectedTab = 'Gifts';

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final partner = widget.partner;
    return Scaffold(
      backgroundColor: kScreenBg,
      body: SafeArea(
        child: Column(
          children: [
            _buildTopBar(context, partner),
            _buildRelationshipProgress(partner),
            _buildCategoryTabs(),
            const Divider(height: 1, color: Color(0xFFEDEDF2)),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                children: [
                  _buildLocationCard(),
                  const SizedBox(height: 20),
                  _buildDateDivider('TODAY'),
                  const SizedBox(height: 12),
                  _buildSystemText("You reacted to ${partner.name}'s About"),
                  const SizedBox(height: 16),
                  _buildOutgoingBubble(
                    "If you're as fun in person as your profile, I'm in.",
                    '1:04 PM',
                  ),
                  const SizedBox(height: 12),
                  _buildGiftBubble(partner),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
  Widget _buildTopBar(BuildContext context, ChatPartner partner) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black87,
              size: 28,
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey.shade300,
                backgroundImage: NetworkImage(partner.avatarUrl),
              ),
              if (partner.isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        partner.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    if (partner.isPlatinum) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "PLATINUM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            letterSpacing: .5,
                          ),
                        ),
                      ),
                    ]
                  ],
                ),
                const SizedBox(height: 2),
                if (partner.isOnline)
                  const Text(
                    "Online",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const Icon(
              Icons.call_outlined,
              color: kAccentPink,
              size: 22,
            ),
          ),
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const Icon(
              Icons.videocam_outlined,
              color: kAccentPink,
              size: 22,
            ),
          ),
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.black87,
            ),
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: "report",
                child: Text("Report"),
              ),
              PopupMenuItem(
                value: "block",
                child: Text("Block"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- RELATIONSHIP PROGRESS ----------------
  Widget _buildRelationshipProgress(ChatPartner partner) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'RELATIONSHIP PROGRESS',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              Text(
                'LEVEL ${partner.relationshipLevel}',
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: kAccentPink,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: partner.relationshipProgress,
              minHeight: 6,
              backgroundColor: const Color(0xFFEDEDF2),
              valueColor: const AlwaysStoppedAnimation<Color>(kAccentPink),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.check_circle, color: kAccentPink, size: 14),
              const SizedBox(width: 6),
              const Text(
                'Milestone reached: ',
                style: TextStyle(fontSize: 12.5, color: Colors.black54),
              ),
              const Text(
                'Premium Badge unlocked',
                style: TextStyle(fontSize: 12.5, color: kAccentPink, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- CATEGORY TABS ----------------
  Widget _buildCategoryTabs() {
    final tabs = [
      ('Gifts', Icons.card_giftcard, '12'),
      ('Compliments', Icons.chat_bubble_outline, null),
      ('Date Invites', Icons.confirmation_num_outlined, null),
    ];

    return SizedBox(
      height: 42,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final (label, icon, badge) = tabs[index];
          final isSelected = label == _selectedTab;
          return GestureDetector(
            onTap: () => setState(() => _selectedTab = label),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: isSelected ? kAccentPink : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: isSelected ? kAccentPink : const Color(0xFFE4E4EC),
                ),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(icon, size: 15, color: isSelected ? Colors.white : Colors.black54),
                  const SizedBox(width: 6),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  ),
                  if (badge != null) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white24 : const Color(0xFFF1E9EC),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        badge,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? Colors.white : kAccentPink,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ---------------- DATE / LOCATION CARD ----------------
  Widget _buildLocationCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFCEFF3),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.shield_outlined, size: 16, color: Colors.black54),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Meet at the venue - your exact location stays private. '
                  'Have a great date!',
                  style: TextStyle(fontSize: 12.5, color: Colors.black54, height: 1.4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Icon(Icons.location_on, color: kAccentPink, size: 40),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Icon(Icons.location_on, color: kAccentPink, size: 16),
              SizedBox(width: 4),
              Text(
                'Blue Tokai',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kAccentPink,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text('Add to calendar', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black87,
                    side: const BorderSide(color: Color(0xFFE4E4EC)),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text('Get directions', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- CHAT HELPERS ----------------
  Widget _buildDateDivider(String label) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(fontSize: 12, color: Colors.black38, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSystemText(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 12.5, color: Colors.black45),
      ),
    );
  }

  Widget _buildOutgoingBubble(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.72),
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          decoration: BoxDecoration(
            color: kAccentPink,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text, style: const TextStyle(color: Colors.white, fontSize: 14.5, height: 1.35)),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(time, style: const TextStyle(color: Colors.white70, fontSize: 10.5)),
                  const SizedBox(width: 4),
                  const Icon(Icons.done_all, color: Colors.white70, size: 13),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGiftBubble(ChatPartner partner) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade300,
            backgroundImage: NetworkImage(partner.avatarUrl),
          ),
          const SizedBox(width: 8),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.68),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18),
                  topRight: Radius.circular(18),
                  bottomRight: Radius.circular(18),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 2)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text('🌹', style: TextStyle(fontSize: 18)),
                      const SizedBox(width: 6),
                      const Text(
                        'Rose',
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black87),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.circle, size: 6, color: Colors.amber),
                      const SizedBox(width: 3),
                      const Text('10 coins', style: TextStyle(fontSize: 11.5, color: Colors.amber, fontWeight: FontWeight.w600)),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7E6EA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'SENT',
                          style: TextStyle(fontSize: 9.5, fontWeight: FontWeight.w700, color: kAccentPink),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'A little something to brighten your day 🌹',
                    style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- MESSAGE INPUT ----------------
  Widget _buildMessageInput() {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_circle_outline, color: Colors.black54),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.image_outlined, color: Colors.black54),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE4E4EC)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: InputDecoration(
                          hintText: 'Message ${widget.partner.name}...',
                          hintStyle: const TextStyle(color: Colors.black38, fontSize: 14),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const Icon(Icons.mic_none, color: Colors.black38, size: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            GestureDetector(
              onTap: () {
              
                _messageController.clear();
              },
              child: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: kAccentPink,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.send, color: Colors.white, size: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}