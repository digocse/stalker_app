import 'package:stalkerapp/models/starred_repo.dart';
import 'package:stalkerapp/models/user.dart';

class ScreenArguments {
  ScreenArguments({this.user, this.starredRepos});
  final User user;
  final List<StarredRepo> starredRepos;
}
