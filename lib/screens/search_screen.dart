import 'package:flutter/material.dart';
import 'package:stalkerapp/constants.dart';
import 'package:stalkerapp/models/network.dart';
import 'package:stalkerapp/models/screen_arguments.dart';
import 'package:stalkerapp/screens/profile_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String id = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var username = '';

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'The Stalker App',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                SizedBox(height: 12.0),
                CircleAvatar(
                  radius: 50.0,
                  backgroundColor: kBackgroundColor,
                  child: Image.asset(
                    'assets/gh-logo.png',
                    height: 400.0,
                    width: 400.0,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18.0)),
                      ),
                      filled: true,
                      fillColor: Colors.white70,
                      hintText: 'Digite o nome ou apelido do usuário',
                    ),
                  ),
                ),
                FlatButton(
                  color: Colors.white,
                  child: Text(
                    'Buscar',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                    ),
                  ),
                  onPressed: () async {
                    username = textFieldController.text;
                    var network = Network();
                    var starredRepos =
                        await network.searchStarredRepos(username);
                    var user = await network.retrieveUser(username);

                    if (user != null && starredRepos != null) {
                      Navigator.pushNamed(
                        context,
                        ProfileScreen.id,
                        arguments: ScreenArguments(
                            user: user, starredRepos: starredRepos),
                      );
                    } else {
                      _showErrorDialog();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showErrorDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Usuário não encontrado"),
          content: new Text("Não encontramos o usuário procurado"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }
}
