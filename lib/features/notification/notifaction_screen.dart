// 📁 notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:interview_assignment/features/notification/enum.dart';
import 'package:interview_assignment/features/home/model/notifaction_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});
  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = [
    'All  56',
    'Likes & roses',
    'Matches',
    'Gifts',
    'Dates',
  ];

  // ---------- NOTIFICATION ITEMS with fresh randomuser.me images ----------
  final List<NotifItem> _items = [
    NotifItem(
      imageUrl: 'https://randomuser.me/api/portraits/men/10.jpg', // Dev
      avatarBgColor: const Color(0xFFB78BE0),
      badgeType: NotifBadgeType.rose,
      badgeColor: const Color(0xFFE94F80),
      boldPart: 'Dev, 27',
      titleRich: 'sent you a Rose',
      quote: '"Your trekking photos sold me — let\'s swap trail stories."',
      time: '12 min ago',
      unread: true,
      buttonLabel: 'View profile',
    ),
    NotifItem(
      imageUrl: 'https://randomuser.me/api/portraits/men/20.jpg', // Arjun
      avatarBgColor: const Color(0xFF8FB6E0),
      badgeType: NotifBadgeType.star,
      badgeColor: const Color(0xFFFFA726),
      boldPart: 'Arjun, 28',
      titleRich: 'complimented your About',
      quote: '"Equally driven and equally curious — that line got me."',
      time: '3 h ago',
      unread: false,
    ),
    NotifItem(
      imageUrl: 'https://randomuser.me/api/portraits/women/30.jpg', // Aanya
      avatarBgColor: const Color(0xFFE0A6C8),
      badgeType: NotifBadgeType.heart,
      badgeColor: const Color(0xFF4CAF50),
      boldPart: "It's a match with Aanya, 25",
      titleRich: '',
      quote: 'You both liked each other. Say hello before the spark fades.',
      time: '40 min ago',
      unread: true,
      buttonLabel: 'Send a message',
    ),
    NotifItem(
      imageUrl: 'https://randomuser.me/api/portraits/women/40.jpg', // Elena
      avatarBgColor: const Color(0xFF9AA6B2),
      badgeType: NotifBadgeType.message,
      badgeColor: const Color(0xFFE94F80),
      boldPart: 'Elena, 23',
      titleRich: 'sent you a message',
      quote: '"Haha okay that café pick was elite. When are you free?"',
      time: '1 h ago',
      unread: false,
    ),
    NotifItem(
      imageUrl: null, // Kabir – calendar icon
      avatarBgColor: const Color(0xFFE7C9A0),
      badgeType: NotifBadgeType.calendar,
      badgeColor: const Color(0xFFE7C9A0),
      boldPart: 'Kabir',
      titleRich: 'approved your date request',
      quote: 'Coffee at Blue Tokai - Today, 7:00 PM - Koregaon Park',
      time: '2 h ago',
      unread: true,
      buttonLabel: 'Open chat',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F5), // light grey background
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            const SizedBox(height: 8),
            _buildUpdatesBadge(), // new "9 new updates" container
            const SizedBox(height: 16),
            _buildFilterChips(),
            const SizedBox(height: 14),
            _buildSectionLabel('TODAY'),
            const SizedBox(height: 8),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFFF4F4F4),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 18,
                color: Colors.black87,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Notifications',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          const Text(
            'Mark all read',
            style: TextStyle(
              color: Color(0xFFE94F80),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ---------- NEW: "9 new updates" badge (light blue container) ----------
  Widget _buildUpdatesBadge() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFE8F0FE),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFD0E0FF)),
        ),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF4A90E2),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              '9 new updates',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF4A90E2),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = _selectedFilter == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF1C1C1E) : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selected ? Colors.transparent : const Color(0xFFE0E0E0),
                  width: 1,
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

  Widget _buildSectionLabel(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 4, bottom: 20),
      itemCount: _items.length,
      itemBuilder: (context, index) => _buildCard(_items[index]),
    );
  }

  IconData _iconFor(NotifBadgeType t) {
    switch (t) {
      case NotifBadgeType.rose:
        return Icons.local_florist;
      case NotifBadgeType.star:
        return Icons.star;
      case NotifBadgeType.heart:
        return Icons.favorite;
      case NotifBadgeType.message:
        return Icons.chat_bubble;
      case NotifBadgeType.calendar:
        return Icons.calendar_today;
    }
  }

  Widget _buildAvatar(NotifItem item) {
    if (item.imageUrl == null) {
      // Calendar-style icon avatar (Kabir)
      return Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: const Color(0xFFF3E0C4),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(
          Icons.calendar_today,
          color: Color(0xFFC98A3B),
          size: 24,
        ),
      );
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: item.avatarBgColor,
          backgroundImage: NetworkImage(item.imageUrl!),
        ),
        Positioned(
          bottom: -2,
          right: -2,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: item.badgeColor,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(
              _iconFor(item.badgeType),
              size: 12,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCard(NotifItem item) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.06),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAvatar(item),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14.5,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: item.boldPart,
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      ),
                      if (item.titleRich.isNotEmpty)
                        TextSpan(text: ' ${item.titleRich}'),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.quote,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  item.time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                if (item.buttonLabel != null) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 32,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE94F80),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 12.5,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      child: Text(item.buttonLabel!),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (item.unread)
            Padding(
              padding: const EdgeInsets.only(left: 6, top: 4),
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFE94F80),
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}