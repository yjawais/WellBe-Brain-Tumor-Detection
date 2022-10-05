import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String? uid;
  String? email;
  String? username;
  String? phone;
  String? userType;
  bool? isProfileComplete;
  UserModel({
    this.uid,
    this.email,
    this.username,
    this.phone,
    this.userType,
    this.isProfileComplete,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'username': username,
      'phone': phone,
      'userType': userType,
      'isProfileComplete': isProfileComplete,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic>? map) {
    return UserModel(
      uid: map!['uid'] ?? '',
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      phone: map['phone'] ?? '',
      userType: map['userType'] ?? '',
      isProfileComplete: map['isProfileComplete'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
