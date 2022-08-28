import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget {

  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Center(
         child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children:[
            Text("sign in with: "+ user.email!),
            MaterialButton(onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            color:const Color.fromARGB(226, 89, 84, 243),
            child:const Text("Sign out"),
            )

         ]
         ),
       ),
    );
  }
}