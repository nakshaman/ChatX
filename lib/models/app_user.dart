class AppUser {
  final String uid;
  final String email;
  final String name;
  final String imageUrl;

  AppUser({
    required this.uid,
    required this.email,
    required this.imageUrl,
    required this.name,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      name: json['name'],
    );
  }
}
