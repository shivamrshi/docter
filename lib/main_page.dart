import 'package:docter/home.dart';
import "package:flutter/material.dart";
import 'package:firebase_auth/firebase_auth.dart';

import 'loginpage.dart';

class mainpage extends StatelessWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const home();
              } else {
                return Loginpage();
              }
            }));
  }
}
