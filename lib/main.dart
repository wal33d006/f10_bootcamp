import 'package:f10_bootcamp/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  List<User> myUsers = [
    User(
      name: 'Waleed',
      email: 'waleed@gmail.com',
      phoneNumber: '03453535343',
    ),
    User(
      name: 'Shakir',
      email: 'shakir@gmail.com',
      phoneNumber: '986457398457',
    ),
    User(
      name: 'Hello World',
      email: 'hello@gmail.com',
      phoneNumber: '343457',
    ),
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: myUsers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(myUsers[index].name),
            subtitle: Text(myUsers[index].email),
            trailing: Text(myUsers[index].phoneNumber),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class User {
  String name;
  String email;
  String phoneNumber;

  User({this.email, this.name, this.phoneNumber});
}
