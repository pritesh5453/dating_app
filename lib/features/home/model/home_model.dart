class HomeModel {
  final String id;
  final String firstName;
  final String lastName;
  final String gender;
  final int age;
  final String city;
  final String country;
  final String email;
  final String phone;
  final String thumbnail;
  final String picture;
  final bool isOnline;

  HomeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.age,
    required this.city,
    required this.country,
    required this.email,
    required this.phone,
    required this.thumbnail,
    required this.picture,
    required this.isOnline,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as Map<String, dynamic>;
    final location = json['location'] as Map<String, dynamic>;
    final dob = json['dob'] as Map<String, dynamic>;
    final picture = json['picture'] as Map<String, dynamic>;
    final login = json['login'] as Map<String, dynamic>;

    return HomeModel(
      id: login['uuid'] as String,
      firstName: name['first'] as String,
      lastName: name['last'] as String,
      gender: json['gender'] as String,
      age: (dob['age'] as num).toInt(),
      city: location['city'] as String,
      country: location['country'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      thumbnail: picture['thumbnail'] as String,
      picture: picture['large'] as String,
      isOnline: DateTime.now().millisecondsSinceEpoch % 2 == 0,
    );
  }

  String get fullName => '$firstName $lastName';
}
