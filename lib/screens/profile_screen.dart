import 'package:flutter/material.dart';
import 'package:stalkerapp/components/profile_header.dart';
import 'package:stalkerapp/components/starred_repo_card.dart';
import 'package:stalkerapp/constants.dart';
import 'package:stalkerapp/models/screen_arguments.dart';
import 'package:stalkerapp/models/starred_repo.dart';
import 'package:stalkerapp/models/user.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = '/profile';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments screenArguments =
        ModalRoute.of(context).settings.arguments;
    List<StarredRepo> starredRepos = screenArguments.starredRepos;
    User user = screenArguments.user;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          backgroundColor: kBackgroundColor,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black, size: 40.0),
        ),
      ),
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            ProfileHeader(user: user),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 50.0),
              child: Divider(
                color: Colors.white70,
                thickness: 2.0,
              ),
            ),
            Text(
              'Repositórios Favoritos',
              style: TextStyle(fontSize: 28.0),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                  itemCount: starredRepos.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new StarredRepoCard(
                        starredRepo: starredRepos[index]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
