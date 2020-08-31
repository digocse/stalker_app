import 'package:flutter/material.dart';
import 'package:stalkerapp/models/starred_repo.dart';
import 'package:stalkerapp/models/user.dart';
import 'package:stalkerapp/screens/search_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = '/profile';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments =
        ModalRoute.of(context).settings.arguments;
    List<StarredRepo> starredRepos = screenArguments.starredRepos;
    User user = screenArguments.user;

    print(user.nickname);
    print(user.avatar);
    print(user.bio);
    print(user.location);
    print(user.email);
    print(user.url);
    print('===========');
    print(starredRepos);
    print(starredRepos.first.name);
    print(starredRepos.first.description);
    print(starredRepos.first.watchersAmount);
    return Container();
  }
}
