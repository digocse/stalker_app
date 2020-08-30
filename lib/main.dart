import 'package:flutter/material.dart';
import 'package:stalkerapp/screens/search_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(primaryColor: Colors.red),
      initialRoute: SearchScreen.id,
      routes: {
        SearchScreen.id: (context) => SearchScreen(),
      },
    );
  }
}
