import 'package:flutter/material.dart';
import 'package:stalkerapp/models/starred_repo.dart';

class StarredRepoCard extends StatelessWidget {
  StarredRepoCard({@required this.starredRepo});

  final StarredRepo starredRepo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 180.0,
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(Radius.circular(22.0))),
        child: ListTile(
          title: Text(
            starredRepo.name,
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          isThreeLine: true,
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Text(
                    starredRepo.description ?? 'Sem descrição',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                SizedBox(width: 12.0),
                RichText(
                  text: TextSpan(
                    text: starredRepo.watchersAmount.toString() + ' ',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                    children: [
                      WidgetSpan(
                          child: Image.asset(
                        'assets/star.png',
                        height: 20.0,
                        width: 20.0,
                      )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
