import 'package:flutter/material.dart';
import 'package:interview_assignment/features/chat/text_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/activity/activity_screen.dart';
import '../../features/chat/chat_screen.dart';
import '../../features/profile/profile_screen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavBarState();
}

class _NavBarState extends State<Navbar> {
  int _selectedIndex = 0;

  // Matches the app's accent pink used everywhere else (kAccentPink).
  static const Color _selectedColor = Color(0xFFE94873);
  static const Color _unselectedColor = Colors.black54;

  final _screens = const [
    HomeScreen(),
    ActivityScreen(),
    Text('Admirers screen'),
    textScreen(),
    ProfileScreen(),
  ];

  // BUG FIX: reference screenshot uses plain outline Material icons (home,
  // play, heart, chat, calendar) — not custom png assets — with the home
  // icon switching to its filled/rounded variant + pink tint when selected.
  // This also matches the bottom nav already used on the Home screen, so
  // the icon set is now consistent across the app.
  static const List<_NavItemData> _navItems = [
    _NavItemData(
      selectedIcon: Icons.home,
      unselectedIcon: Icons.home_outlined,
      label: 'Home',
    ),
    _NavItemData(
      selectedIcon: Icons.play_circle_rounded,
      unselectedIcon: Icons.play_circle_outline_rounded,
      label: 'Date Now',
    ),
    _NavItemData(
      selectedIcon: Icons.heart_broken_rounded,
      unselectedIcon: Icons.favorite_border_rounded,
      label: 'Admirers',
    ),
    _NavItemData(
      selectedIcon: Icons.chat_sharp,
      unselectedIcon: Icons.chat_outlined,
      label: 'Chat',
    ),
    _NavItemData(
      selectedIcon: Icons.calendar_month_rounded,
      unselectedIcon: Icons.calendar_month_outlined,
      label: 'Events',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    // BUG FIX: reference screenshot shows a floating pill-shaped bar — all
    // four corners rounded, with a small margin around it and a soft
    // shadow — not a bar that spans edge-to-edge with only top corners
    // rounded like before.
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          minimum: EdgeInsets.zero,
          child: Row(
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final selected = _selectedIndex == index;
              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(28),
                  onTap: () => _onItemTapped(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selected ? item.selectedIcon : item.unselectedIcon,
                        size: 24,
                        color: selected ? _selectedColor : _unselectedColor,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.label,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.w400,
                          color: selected ? _selectedColor : _unselectedColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _NavItemData {
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final String label;
  const _NavItemData({
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.label,
  });
}