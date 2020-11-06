import 'package:flutter/material.dart';
//import 'package:week2task4/homekan.dart';

class Isikan extends StatefulWidget {
  final String nama;
  final String password;
  Isikan({Key key, @required this.nama, @required this.password})
      : super(key: key);
  @override
  _IsikanState createState() => _IsikanState();
}

class _IsikanState extends State<Isikan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda"), automaticallyImplyLeading: false),
      body: ListView(
        children: <Widget>[
          Text('Welcome ${widget.nama}'),
          Text('Password anda ${widget.password}'),
          MaterialButton(
              color: Colors.lightGreenAccent,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
