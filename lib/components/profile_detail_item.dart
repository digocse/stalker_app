import 'package:flutter/material.dart';

class ProfileDetailItem extends StatelessWidget {
  ProfileDetailItem({@required this.title, @required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        Text(
          content ?? 'Não informado',
          style: TextStyle(
            color: Colors.brown,
//                fontFamily: kPrimaryFontFamily,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
