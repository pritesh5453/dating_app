// 📁 text_screen.dart – Updated with alternate image URLs (randomuser.me portraits)
import 'package:flutter/material.dart';
import 'package:interview_assignment/features/chat/chat_screen.dart';

const Color kAccentPink = Color(0xFFE94873);
const Color kScreenBg = Color(0xFFF8F7FB);

class textScreen extends StatefulWidget {
  const textScreen({super.key});
  @override
  State<textScreen> createState() => _textScreenState();
}

class _textScreenState extends State<textScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Unread', 'Online', 'Nearby', 'Date'];

  // ---------- NEW MATCHES – all images from randomuser.me portraits ----------
  final List<NewMatch> _matches = [
    NewMatch('Sarah', const Color(0xFFB78BE0),
        'https://randomuser.me/api/portraits/women/10.jpg', // female 10
        isNew: true),
    NewMatch('Ariya', const Color(0xFFE0A6C8),
        'https://randomuser.me/api/portraits/women/20.jpg',
        badgeIcon: Icons.bolt, badgeColor: const Color(0xFFFFC107)),
    NewMatch('Liam', const Color(0xFF8FB6E0),
        'https://randomuser.me/api/portraits/men/30.jpg'), // male 30
    NewMatch('Chloe', const Color(0xFFE0C08F),
        'https://randomuser.me/api/portraits/women/40.jpg',
        badgeIcon: Icons.play_arrow, badgeColor: const Color(0xFFE94F80)),
    NewMatch('Dev', const Color(0xFF7E8FA6),
        'https://randomuser.me/api/portraits/men/50.jpg'), // male 50
  ];

  // ---------- CHAT LIST – all images from randomuser.me portraits ----------
  final List<ChatItem> _chats = [
    ChatItem(
      name: 'Aanya',
      age: 25,
      avatarColor: const Color(0xFFE0A6C8),
      imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
      matchPercent: 92,
      preview: "Can't wait to see you tonight at the…",
      time: '2m',
      online: true,
      progress: 0.55,
      progressLabel: 'Gift unlocked!',
      unreadCount: 2,
      trailingIcon: Icons.card_giftcard,
      trailingIconColor: const Color(0xFFE94F80),
      progressColor: const Color(0xFF4CAF50),
    ),
    ChatItem(
      name: 'Jordan',
      age: 27,
      avatarColor: const Color(0xFF7E97A6),
      imageUrl: 'https://randomuser.me/api/portraits/men/21.jpg',
      matchPercent: 88,
      preview: 'Typing…',
      time: 'Now',
      online: true,
      progress: 0.72,
      progressLabel: '18/25 for Premium Rose',
      isTyping: true,
      trailingIcon: Icons.local_florist,
      trailingIconColor: const Color(0xFFE94F80),
    ),
    ChatItem(
      name: 'Marcus',
      age: 29,
      avatarColor: const Color(0xFF6E7B8C),
      imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
      matchPercent: 75,
      preview: 'That sounds like an amazing hobby! Ho…',
      time: '1h',
      online: false,
      progress: 0.2,
      progressLabel: '5/25 - Deadline 14h',
      trailingIcon: Icons.access_time,
      trailingIconColor: const Color(0xFF8A8A8A),
    ),
    ChatItem(
      name: 'Elena',
      age: 23,
      avatarColor: const Color(0xFFB89BD9),
      imageUrl: 'https://randomuser.me/api/portraits/women/41.jpg',
      matchPercent: 95,
      preview: "You: Hey! I'm heading over now.",
      time: '3h',
      online: true,
      progress: 0.88,
      progressLabel: '22/25 for Silver Ring',
      trailingIcon: Icons.diamond_outlined,
      trailingIconColor: const Color(0xFFE94F80),
    ),
    ChatItem(
      name: 'Rohan',
      age: 26,
      avatarColor: const Color(0xFF9AA6B2),
      imageUrl: 'https://randomuser.me/api/portraits/men/51.jpg',
      matchPercent: 81,
      preview: 'Sounds good, see you then!',
      time: 'Yesterday',
      online: false,
      progress: 0.4,
      progressLabel: '10/25',
      progressColor: const Color(0xFFBFC4CC),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenBg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            _buildSearchBar(),
            const SizedBox(height: 18),
            _buildNewMatchesHeader(),
            const SizedBox(height: 10),
            _buildNewMatchesList(),
            const SizedBox(height: 16),
            _buildFilterChips(),
            const SizedBox(height: 8),
            Expanded(child: _buildChatList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'text',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Icon(Icons.settings_outlined,
                color: Colors.black54, size: 22),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search matches or text',
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear, color: Colors.grey, size: 18),
              onPressed: () {
                // Clear search
              },
            ),
          ),
          onChanged: (value) {
            // Implement search logic
          },
        ),
      ),
    );
  }

  Widget _buildNewMatchesHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'NEW MATCHES',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
              color: kAccentPink,
            ),
          ),
          Row(
            children: const [
              Text('See all',
                  style: TextStyle(fontSize: 13, color: Colors.grey)),
              SizedBox(width: 2),
              Icon(Icons.arrow_forward, size: 14, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewMatchesList() {
    return SizedBox(
      height: 92,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _matches.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final m = _matches[index];
          return InkWell(
            onTap: () => _navigateToMatch(context, m),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      padding: const EdgeInsets.all(2.5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [kAccentPink, Color(0xFFB78BE0)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: m.color,
                        backgroundImage: NetworkImage(m.imageUrl),
                      ),
                    ),
                    if (m.isNew)
                      Positioned(
                        top: -6,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 1),
                          decoration: BoxDecoration(
                            color: kAccentPink,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: const Text('NEW',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    if (m.badgeIcon != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: m.badgeColor,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child:
                              Icon(m.badgeIcon, size: 10, color: Colors.white),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(m.name,
                    style: const TextStyle(fontSize: 11, color: Colors.black87)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = _selectedFilter == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? kAccentPink : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? kAccentPink : const Color(0xFFE0E0E0),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                _filters[index],
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: selected ? Colors.white : Colors.black54,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      itemCount: _chats.length,
      itemBuilder: (context, index) => _buildChatTile(_chats[index]),
    );
  }

  void _navigateToChat(BuildContext context, ChatItem c) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 180),
        reverseTransitionDuration: const Duration(milliseconds: 160),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: ChatScreen(
              partner: ChatPartner(
                name: c.name,
                avatarUrl: c.imageUrl,
                isOnline: c.online,
                isPlatinum: c.matchPercent > 85,
                relationshipLevel: 2,
                relationshipProgress: c.progress,
              ),
            ),
          );
        },
      ),
    );
  }

  void _navigateToMatch(BuildContext context, NewMatch m) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 180),
        reverseTransitionDuration: const Duration(milliseconds: 160),
        pageBuilder: (context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
            ),
            child: ChatScreen(
              partner: ChatPartner(
                name: m.name,
                avatarUrl: m.imageUrl,
                isOnline: false,
                isPlatinum: false,
                relationshipLevel: 1,
                relationshipProgress: 0.0,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatTile(ChatItem c) {
    return GestureDetector(
      onTap: () => _navigateToChat(context, c),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: c.avatarColor,
                  backgroundImage: NetworkImage(c.imageUrl),
                ),
                if (c.online)
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('${c.name}, ${c.age}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      const SizedBox(width: 8),
                      Text('${c.matchPercent}% Match',
                          style: const TextStyle(
                              color: kAccentPink,
                              fontSize: 12,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    c.preview,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: c.isTyping ? kAccentPink : Colors.grey[600],
                      fontSize: 13,
                      fontWeight: c.isTyping ? FontWeight.w600 : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: c.progress,
                            minHeight: 5,
                            backgroundColor: const Color(0xFFE9E5EA),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(c.progressColor),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        c.progressLabel,
                        style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                      ),
                      if (c.trailingIcon != null) ...[
                        const SizedBox(width: 4),
                        Icon(c.trailingIcon, size: 12, color: c.trailingIconColor),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(c.time,
                    style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                const SizedBox(height: 6),
                if (c.unreadCount != null)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: kAccentPink,
                      shape: BoxShape.circle,
                    ),
                    constraints:
                        const BoxConstraints(minWidth: 20, minHeight: 20),
                    alignment: Alignment.center,
                    child: Text(
                      '${c.unreadCount}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}