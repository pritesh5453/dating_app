import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_assignment/features/home/presentation/widgets/opinion_card.dart';
import 'package:interview_assignment/features/notification/notifaction_screen.dart';
import 'package:interview_assignment/features/home/presentation/widgets/DatingCard.dart';
import 'package:interview_assignment/features/home/presentation/widgets/bio.dart';
import 'package:interview_assignment/features/home/presentation/widgets/personal_info.dart';
import 'package:interview_assignment/features/home/presentation/widgets/work_profile.dart';
import 'package:interview_assignment/features/home/presentation/widgets/arg_card.dart';
import 'package:interview_assignment/features/home/presentation/widgets/hobbies.dart';
import 'package:interview_assignment/features/home/presentation/widgets/daily_habits.dart';
import 'package:interview_assignment/features/home/presentation/widgets/media_gallery.dart';
import 'package:interview_assignment/features/home/presentation/widgets/promt.card.dart';
import 'package:interview_assignment/features/home/presentation/widgets/favorites_card.dart';
import 'package:interview_assignment/features/home/presentation/widgets/intro_clip_card.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_event.dart';
import '../bloc/home_state.dart';
import '../widgets/swipe_match.dart';


const Color kAccentPink = Color(0xFFE94873);
const Color kScreenBg = Color.fromARGB(255, 240, 236, 223);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;
  int _currentCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScreenBg,
      appBar: HomeAppBar(),
      // BUG FIX: the bottom navigation bar was built (_buildBottomNav) but
      // never attached to the Scaffold, so it never rendered. In the video
      // the nav bar stays pinned to the bottom of the screen at all times
      // while only the content above it scrolls — that only happens when
      // it's supplied via Scaffold.bottomNavigationBar (not placed inside
      // the scrolling body).
     
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //  _buildTopBar(context),
              Expanded(
                child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state.status == UserStatus.loading) {
                      return const Center(
                        child: CircularProgressIndicator(color: kAccentPink),
                      );
                    }
                    if (state.status == UserStatus.failure) {
                      return _buildError(context, state.message);
                    }
                    if (state.users.isEmpty) {
                      return const Center(
                        child: Text(
                          'No more profiles 🙈',
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      );
                    }
          
                    final profiles =
                        state.users.map(ProfileCardData.fromUser).toList();
                    final safeIndex = _currentCardIndex.clamp(
                      0,
                      profiles.length - 1,
                    );
          
                    return SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.62,
                              child: Swipe_match(
                                users: state.users,
                                onIndexChanged: (index) {
                                  setState(() => _currentCardIndex = index);
                                },
                              ),
                            ),
                          
                            SizedBox(height: 20),
                            Bio(),
                            const Text(
                              "THE BASICS ",
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 2,
                                color: Color(0xffD65B66),
                              ),
                            ),
          SizedBox(height: 10),
                            Personal_info(),
                            roseIcon(),
                            Intro_clip(),
                            roseIcon(),
                            OpinionCard(),
                            roseIcon(),
                            Work_profile(),
                            roseIcon(),
                        
                            favorites_card(),
                            SizedBox(height: 10),

                            roseIcon(),
                        
                            // SizedBox(height: 15),
                        
                            SizedBox(height: 20),
                        
                            Hobbies(),
                            SizedBox(height: 10),
                        
                            roseIcon(),
                        
                            SizedBox(height: 20),
                        
                            DailyHabitsCard(),
                            SizedBox(height: 10),
                        
                            roseIcon(),
                        
                            SizedBox(height: 15),
                        
                            DatingCard(),
                            SizedBox(height: 15),

                            // roseIcon(),
                        
                            Media_galllery(
  image: "https://picsum.photos/600/800",
),
                            SizedBox(height: 15),
                        
                            ArgCard(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- TOP BAR ----------------
  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(Icons.menu, color: Colors.black87, size: 26),
          const SizedBox(width: 12),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 12,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.circle, color: kAccentPink, size: 8),
                  SizedBox(width: 6),
                  Text(
                    'Daily 25',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          _topIconButton(Icons.bolt, Colors.amber.shade700),
          const SizedBox(width: 8),
          _topIconButton(Icons.workspace_premium, Colors.deepPurple),
          const SizedBox(width: 8),
          Stack(
            clipBehavior: Clip.none,
            children: [
              _topIconButton(Icons.notifications_none, Colors.black87),
              Positioned(
                right: 4,
                top: 4,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: kAccentPink,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _topIconButton(IconData icon, Color color) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Icon(icon, color: color, size: 20),
    );
  }

  Widget _buildError(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Something went wrong',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 16),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: kAccentPink),
              onPressed:
                  () =>
                      context.read<UserBloc>().add(const UserFetchRequested()),
              child: const Text('Try again'),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- BOTTOM NAV ----------------
  
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(74);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      toolbarHeight: 74,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      titleSpacing: 12,
      title: Row(
  children: [
    // Menu Button (No Action)
    _circleButton(
      Icons.menu,
      context,
    ),

    const Spacer(),

    Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 3,
            backgroundColor: kAccentPink,
          ),
          SizedBox(width: 8),
          Text(
            "Daily 25",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    ),

    const SizedBox(width: 16),

    _circleImageButton("assets/Icons/premium_icon.png"),

    const SizedBox(width: 10),

    // Filter Button (No Action)
    _circleButton(
      Icons.tune,
      context,
    ),

    const SizedBox(width: 10),

    // Notification Button (Only this opens notification)
    Stack(
      children: [
        _circleButton(
          Icons.notifications_none,
          context,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NotificationsScreen(),
              ),
            );
          },
        ),
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: kAccentPink,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    ),
  ],
), );
  }

  Widget _circleButton(
  IconData icon,
  BuildContext context, {
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(
        icon,
        size: 20,
        color: Colors.black87,
      ),
    ),
  );
}

Widget _circleImageButton(String images) {
  return Container(
    width: 42,
    height: 42,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        images,
        width: 15,
        height: 15,
      ),
    ),
  );
}
}

class roseIcon extends StatelessWidget {
  const roseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return        Align(
  alignment: Alignment.bottomRight,
  child: Container(
    width: 40,
    height: 40,
    decoration: BoxDecoration(
      color: const Color(0xFFFFF8F8),
      shape: BoxShape.circle,
      border: Border.all(
        color: const Color(0xFFF2D5DD),
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Center(
      child: Image.asset(
        "assets/Icons/rose.png",
        width: 20,
        height: 20,
        fit: BoxFit.contain,
      ),
    ),
  ),
);
  }
}