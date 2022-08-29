import 'dart:ui';
import 'package:docter/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import '../mum_box.dart';

class Loginpage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const Loginpage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }
  // get floatingActionButtonLocation => null;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        //image or Any text fo user guidence.
        mum(
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
            height: 250,
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
          // width: MediaQuery.of(context).size.width * 0.5,
        ),
        const Text(
          "Welcome Back",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),

        //email textfeild
        Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 4, bottom: 1),
          child: TextFormField(
            controller: _emailController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: "Enter email id",
              labelText: "Email id",
              // iconColor:Color.fromARGB(255, 96, 96, 197),
            ),
          /*  validator: (value) {
              if (value!.isEmpty) {
                return "email id can not be empty";
              }
              return null;
            },*/
          ),
        ),
        const SizedBox(height: 2),
        //passward textfeild
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Enter passward",
              labelText: "passward",
            ),
           validator: (value) {
              if (value!.isEmpty) {
                return "passwrd can not be empty";
              } else if (value.length < 6) {
                return "passward length should be atleast 6";
              }

              return null;
            },
          ),
        ),
        //forget passward
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text("Forget passward",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ),

        //sign in
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(226, 89, 84, 243),
              minimumSize: Size.fromHeight(45),
            ),
            icon: const Icon(
              Icons.lock_open,
              size: 32,
              color: Colors.white,
            ),
            label: const Text(
              "Sign In",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: signIn,
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        //not a user ? Register
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("Not a member? ", style: TextStyle(fontSize: 18)),
          GestureDetector(
            onTap: widget.showRegisterPage,
            child: const Text("Register Here",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          ),
        ]),
        // text
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
        const Text("---Or continue with---", style: TextStyle(fontSize: 18)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Row(
            children: [
              FloatingActionButton.extended(
                onPressed: () {},
                icon: Image.asset("assets/images/google.png",
                    height: 33, width: 33),
                label:const Text("Google"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              SizedBox(
                //height: MediaQuery.of(context).size.height * 0.01,
                width: MediaQuery.of(context).size.width * 0.19,
              ),
              FloatingActionButton.extended(
                onPressed: () {},
                icon: Image.asset("assets/images/facebook.png",
                    height: 33, width: 33),
                label:const Text("Facbook"),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        )
      ])),
    );
  }
}
