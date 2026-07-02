class ProfileData {
  final String name;
  final int age;
  final String distance;
  final String profession;
  final String height;
  final String imageUrl;
  final int trustPercent;
  final String replyTime;
  final bool verified;

  ProfileData({
    required this.name,
    required this.age,
    required this.distance,
    required this.profession,
    required this.height,
    required this.imageUrl,
    required this.trustPercent,
    required this.replyTime,
    this.verified = true,
  });
}