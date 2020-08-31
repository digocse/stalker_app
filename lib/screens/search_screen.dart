import 'package:flutter/material.dart';
import 'package:stalkerapp/constants.dart';
import 'package:stalkerapp/models/network.dart';
import 'package:stalkerapp/models/starred_repo.dart';
import 'package:stalkerapp/models/user.dart';
import 'package:stalkerapp/screens/profile_screen.dart';

class SearchScreen extends StatelessWidget {
  static const String id = '/search';

  @override
  Widget build(BuildContext context) {
    final String username = 'digocse';

    return Container(
      color: kBackgroundColor,
      child: FlatButton(
        child: Text(
          'Buscar',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18.0,
          ),
        ),
        onPressed: () async {
          var network = Network();
          var starredRepos = await network.searchStarredRepos(username);
          var user = await network.retrieveUser(username);

          if (starredRepos.length != null && user != null) {
            Navigator.pushNamed(
              context,
              ProfileScreen.id,
              arguments:
                  ScreenArguments(user: user, starredRepos: starredRepos),
            );
          } else {
            // TODO: show offline alert
          }
        },
      ),
    );
  }
}

class ScreenArguments {
  ScreenArguments({this.user, this.starredRepos});
  final User user;
  final List<StarredRepo> starredRepos;
}
