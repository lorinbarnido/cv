import 'package:flutter/material.dart';

@immutable
class User {
  const User({required this.userId, required this.email, required this.username});
  
  final String userId;
  final String email;
  final String username;

  factory User.fromJson(Map<String, dynamic> json) {
    final String userId = json['userId'] as String? ?? '';
    final String username = json['username'] as String? ?? '';
    final String email = json['email'] as String? ?? '';

    return User(userId: userId, email: email, username: username);
  }
}