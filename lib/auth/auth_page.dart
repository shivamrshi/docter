import 'package:docter/pages/loginpage.dart';
import 'package:flutter/material.dart';

import '../pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //intially show the login page
  bool showLoginPage = true;

  void togglescreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Loginpage(showRegisterPage: togglescreen);
    } else {
      return RegisterPage(showLoginPage: togglescreen);
    }
  }
}
