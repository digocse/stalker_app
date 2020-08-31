import 'package:flutter/material.dart';

class User {
  User({
    @required this.nickname,
    this.avatar,
    this.bio,
    this.location: '',
    this.email: '',
    @required this.url,
  });
  final String nickname;
  final NetworkImage avatar;
  final String bio;
  final String location;
  final String email;
  final String url;
}
