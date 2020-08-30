import 'package:flutter/material.dart';
import 'package:stalkerapp/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchScreen extends StatelessWidget {
  static const String id = '/search';

  @override
  Widget build(BuildContext context) {
    final String username = 'digocse';
    final String url = 'https://api.github.com/users/${username}/starred';

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
          var response = await http.get(url);
          if (response.statusCode == 200) {
            var jsonResponse = convert.jsonDecode(response.body);
            print(jsonResponse[0]["name"]);
          } else {
            print('Request failed with status: ${response.statusCode}');
          }
        },
      ),
    );
  }
}
