import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  final String userId;
  UserInfo({this.userId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.userId),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(this.userId),
          )
        ],
      ),
    );
  }

}