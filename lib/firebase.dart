import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseScreen extends StatefulWidget {
  @override
  _FirebaseScreenState createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    _addDataToFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError)
            return new Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return new Text('Loading...');
            default:
              return new ListView(
                children: snapshot.data.documents.map((DocumentSnapshot document) {
                  return new ListTile(
                    title: new Text(document['name']),
                    subtitle: new Text(document['LastName']),
                  );
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Firestore.instance.collection('users').document()
              .setData({ 'name': 'Hello', 'LastName': 'Google' });
        },
      ),
    );
  }

  void _addDataToFirebase() async {
    Firestore.instance.collection('users').document()
        .setData({ 'name': 'Waleed', 'LastName': 'Arshad' });
  }
}