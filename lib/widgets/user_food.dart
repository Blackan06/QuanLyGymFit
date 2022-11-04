import 'package:flutter/material.dart';

class UserFoodItem extends StatelessWidget {
  final String name;

  UserFoodItem(this.name);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: TextStyle(color: Colors.yellow),
      ),
    );
  }
}
