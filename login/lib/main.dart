import 'package:firebase_core/firebase_core.dart';
import './authPage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Shippiing B2C',
          style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Noto Sans Thai'),
        ),
      ),
      body: Center(
          child: Text(
        'Welcome To B2C!',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          // fontFamily: 'Noto Sans Thai',
          color: Colors.blue[700],
        ),
      )),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => authPage()));
        },
        label: Text('Login',
            style: TextStyle(
              color: Colors.white,
              // fontFamily: 'Noto Sans Thai'
            )),
        //backgroundColor: Color.fromRGBO(40, 84, 48, 1),
        backgroundColor: Colors.blue[700],
      ),
    );
  }
}
