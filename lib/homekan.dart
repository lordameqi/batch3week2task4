import 'package:flutter/material.dart';
import 'isi/isikan.dart';

// ignore: must_be_immutable
class Homekan extends StatelessWidget {
  // ignore: non_constant_identifier_names
  final UsernamekuController = TextEditingController();
  // ignore: non_constant_identifier_names
  final PasswordkuController = TextEditingController();
  String nUsernameku, nPasswordku;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login"), automaticallyImplyLeading: false),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Container(
                child: Image.network(
              'https://cf.shopee.co.id/file/d136efe765a032b86d725916f4547bce',
              width: 100.0,
              height: 120.0,
              fit: BoxFit.cover,
            )),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: true,
                            controller: UsernamekuController,
                            keyboardType: TextInputType.text,
                            decoration: new InputDecoration(
                              hintText: "masukan Username anda",
                              labelText: "Username",
                              icon: Icon(Icons.people),
                              border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Username tidak boleh kosong';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                              autofocus: true,
                              controller: PasswordkuController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: new InputDecoration(
                                hintText: "masukan Password anda",
                                labelText: "Password",
                                icon: Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0)),
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Password tidak boleh kosong';
                                }
                                return null;
                              }),
                          RaisedButton(
                            child: Text(
                              "Submit",
                              style: TextStyle(color: Colors.white),
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              nUsernameku = UsernamekuController.text;
                              nPasswordku = PasswordkuController.text;
                              if (_formKey.currentState.validate()) {
                                if (nUsernameku != 'admin' &&
                                    nPasswordku != 'admin') {
                                  print('Username Salah');
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Isikan(
                                                nama: nUsernameku,
                                                password: nPasswordku,
                                              )));
                                }
                              }
                            },
                          )
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
