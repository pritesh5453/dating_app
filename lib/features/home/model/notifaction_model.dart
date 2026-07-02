import 'dart:ui';

import 'package:interview_assignment/features/notification/enum.dart';
import 'package:interview_assignment/features/notification/notifaction_screen.dart';

class NotifItem {
  final String? imageUrl;
  final Color avatarBgColor;
  final NotifBadgeType badgeType;
  final Color badgeColor;
  final String titleRich; 
  final String boldPart; 
  final String quote;
  final String time;
  final bool unread;
  final String? buttonLabel;

  NotifItem({
    this.imageUrl,
    required this.avatarBgColor,
    required this.badgeType,
    required this.badgeColor,
    required this.boldPart,
    required this.titleRich,
    required this.quote,
    required this.time,
    this.unread = false,
    this.buttonLabel,
  });
}
