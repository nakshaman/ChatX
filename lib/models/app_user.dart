class AppUser {
  final String uid;
  final String email;
  final String username;
  final String imageUrl;

  AppUser({
    required this.uid,
    required this.email,
    required this.imageUrl,
    required this.username,
  });

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      email: json['email'],
      imageUrl: json['imageUrl'],
      username: json['username'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'imageUrl': imageUrl,
    };
  }
}
