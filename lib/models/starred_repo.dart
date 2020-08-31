import 'package:flutter/cupertino.dart';

class StarredRepo {
  StarredRepo({
    @required this.name,
    this.description: '',
    this.watchersAmount: 0,
  });
  final String name;
  final String description;
  final int watchersAmount;
}
