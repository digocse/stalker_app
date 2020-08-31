import 'package:flutter/material.dart';
import 'package:stalkerapp/components/profile_detail_item.dart';
import 'package:stalkerapp/models/user.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({@required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: user.avatar,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                user.nickname,
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProfileDetailItem(title: 'Bio', content: user.bio),
                ProfileDetailItem(title: 'Localização', content: user.location),
                ProfileDetailItem(title: 'E-mail', content: user.email),
                ProfileDetailItem(title: 'URL', content: user.url),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
