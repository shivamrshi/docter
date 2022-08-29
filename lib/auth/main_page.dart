import 'package:docter/auth/auth_page.dart';
import 'package:docter/pages/home.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

class Mainpage extends StatelessWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Home();
              } else {
                return AuthPage();
              }
            }));
  }
}
