import 'package:flutter/material.dart';

class ModelUser {
  final ImageProvider? profile;
  final String email;
  final String username;
  final String password;

  ModelUser({
    this.profile,
    required this.username,
    required this.email,
    required this.password,
  });
}
