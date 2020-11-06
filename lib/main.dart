import 'package:flutter/material.dart';

import 'isi/isikan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PageLogin(),
    );
  }
}

class PageLogin extends StatefulWidget {
  @override
  _PageLoginState createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  final myUsernameController = TextEditingController();

  final myPasswordController = TextEditingController();

  String nUsername, nPassword;

  //tambahkan form
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              //cek data field nya kosong
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Username';
                }
                return null;
              },

              controller: myUsernameController,
              decoration: InputDecoration(
                hintText: 'Input Username',
              ),
            ),
            TextFormField(
              //cek data field nya kosong
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Username';
                }
                return null;
              },
              maxLength: 16,
              maxLengthEnforced: true,
              controller: myPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password',
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 85.0,
              height: 50.0,
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                //cek apakah username = rizki
                //cek password < 5 : gak bisa login, >5 bisa login

                //ngambil value dari widget textfield
                nUsername = myUsernameController.text;
                nPassword = myPasswordController.text;

                if (_formKey.currentState.validate()) {
                  if (nUsername != 'admin' && nPassword != 'admin') {
                    print("username salah");
                  }  else {
                    //aksi pindah
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Isikan(
                                  nama: nUsername,
                                  password:
                                      nPassword, // variable yang di pass ke page home
                                )));
                  }
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
