import 'package:f10_bootcamp/covid_api.dart';
import 'package:f10_bootcamp/covid_model.dart';
import 'package:f10_bootcamp/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  Color iconColor = Colors.grey;
  IconData icon = Icons.favorite_border;

  bool _isLoading = false;

  GlobalInfo globalInfo = GlobalInfo();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
//          Expanded(
//            child: ListView.builder(
//              itemCount: myUsers.length,
//              itemBuilder: (context, index) {
//                return ListTile(
//                  title: Text(myUsers[index].name),
//                  subtitle: Text(myUsers[index].email),
//                  trailing: Text(myUsers[index].phoneNumber),
//                );
//              },
//            ),
//          ),
          ListTile(
            title: Text('Stateful widget'),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  iconColor = Colors.blue;
                  icon = Icons.favorite;
                });
              },
              child: Icon(
                icon,
                color: iconColor,
              ),
            ),
          ),
          WaleedWidget(
              firstName: Text('Waleed'),
              lastName: Text('Arshad'),
              leading: CircleAvatar(
                child: Text('WA'),
              ),
              trailing: Icon(Icons.format_quote)),
          _isLoading ? CircularProgressIndicator() : Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  title: Text(globalInfo.cases.toString()),
                  subtitle: Text('Cases'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(globalInfo.deaths.toString()),
                  subtitle: Text('Deaths'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text(globalInfo.recovered.toString()),
                  subtitle: Text('Recovered'),
                ),
              ),
            ],
          ),
        ],
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

  void _fetchData() async {
    setState(() {
      _isLoading = true;
    });
    CovidApi api = CovidApi();
    var response = await api.getGlobalInfo();
    setState(() {
      globalInfo = response;
      _isLoading = false;
    });
  }
}

class WaleedWidget extends StatelessWidget {
  final Widget firstName;
  final Widget lastName;
  final Widget leading;
  final Widget trailing;

  WaleedWidget({this.firstName, this.trailing, this.lastName, this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              leading,
              SizedBox(
                width: 16.0,
              ),
              Column(
                children: <Widget>[firstName, lastName],
              ),
            ],
          ),
          trailing,
        ],
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
