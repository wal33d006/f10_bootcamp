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
      body: Column(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Text('WA'),
            ),
            title: Text('Waleed Arshad'),
            subtitle: Text('waleed@gmail.com'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('WA'),
            ),
            title: Text('Waleed Arshad'),
            subtitle: Text('waleed@gmail.com'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('WA'),
            ),
            title: Text('Waleed Arshad'),
            subtitle: Text('waleed@gmail.com'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Text('WA'),
            ),
            title: Text('Waleed Arshad'),
            subtitle: Text('waleed@gmail.com'),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your name'
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            child: Text('Login'),
          ),
//          Text(
//            '$_counter',
//            style: Theme.of(context).textTheme.headline4,
//          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
