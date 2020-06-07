import 'package:f10_bootcamp/user_info.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TextFormField(
                controller: userIdController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter user ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter password'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      child: Text('Login'),
                      onPressed: () {
                        print(userIdController.text);
                        print(passwordController.text);

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => UserInfo(
                              userId: userIdController.text,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
