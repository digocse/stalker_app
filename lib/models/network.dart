import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:stalkerapp/constants.dart';
import 'package:stalkerapp/models/starred_repo.dart';
import 'package:stalkerapp/models/user.dart';

class Network {
  List<StarredRepo> starredRepos = [];

  Future<List<StarredRepo>> searchStarredRepos(String username) async {
    var url = '$kApiURL/users/$username/starred';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return parseStarredReposResponse(response);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }

  List<StarredRepo> parseStarredReposResponse(http.Response response) {
    var jsonResponse = convert.jsonDecode(response.body);

    for (var repoElement in jsonResponse) {
      var starredRepo = StarredRepo(
          name: repoElement["name"],
          description: repoElement["description"],
          watchersAmount: repoElement["watchers_count"]);
      starredRepos.add(starredRepo);
    }
    return starredRepos;
  }

  Future<User> retrieveUser(String username) async {
    var url = '$kApiURL/users/$username';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return parseUserResponse(response);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return null;
    }
  }

  User parseUserResponse(http.Response response) {
    var jsonResponse = convert.jsonDecode(response.body);

    return User(
      nickname: jsonResponse["name"],
      url: jsonResponse["url"],
      avatar: NetworkImage(jsonResponse["avatar_url"]),
      bio: jsonResponse["bio"],
      location: jsonResponse["location"],
      email: jsonResponse["email"],
    );
  }
}
