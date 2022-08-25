import 'dart:ui';
import 'package:docter/home.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import 'mum_box.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  get floatingActionButtonLocation => null;

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
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: "Enter email id",
                labelText: "Email id",
                // iconColor:Color.fromARGB(255, 96, 96, 197),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "email id can not be empty";
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 2),
          //passward textfeild
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
            child: TextFormField(
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

          Padding(
            padding: const EdgeInsets.only(
                right: 120, left: 120, top: 14, bottom: 16),
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(226, 89, 84, 243),
                  borderRadius: BorderRadius.circular(20),

                  /*  boxShadow: const [
                   //dark shadow bottom right
                   BoxShadow(
                    color:Colors.grey,
                    blurRadius: 23,
                    offset:Offset(5, 5)
                   ),

                   BoxShadow(
                    color:Colors.white,
                    blurRadius: 23,
                    offset:Offset(-5,-5)
                   )
                  ]*/
                ),
                child: const Center(
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          ),

          //not a user ? Register
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text("Not a member? ", style: TextStyle(fontSize: 18)),
            Text("Register Here",
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 18))
          ]),
          // text
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text("---Or continue with---", style: TextStyle(fontSize: 18)),
           SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:32 ),
          child: Row(
            children: [
              FloatingActionButton.extended(onPressed: () {} ,
              icon: Image.asset("assets/images/google.png",height: 33,
              width: 33),
               label: Text("Google"),
               backgroundColor: Colors.white,
               foregroundColor: Colors.black,),
                
                 SizedBox(
            //height: MediaQuery.of(context).size.height * 0.01,
            width: MediaQuery.of(context).size.width * 0.19,
          ),
                FloatingActionButton.extended(onPressed: () {} ,
              icon: Image.asset("assets/images/facebook.png",height: 33,
              width: 33),
               label: Text("Facbook"),
               backgroundColor: Colors.white,
               foregroundColor: Colors.black,),
            ],
            
          ),
        )
        ]
        )
        ),
        
        );
  }
}
