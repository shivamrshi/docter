import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
   final _emailController = TextEditingController();
    
    @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

    Future passwordReset() async {
      try{ 
        await FirebaseAuth.instance.
        sendPasswordResetEmail(email:  _emailController.text.trim());
            showDialog(context: context,
         builder: (context) {
          return const AlertDialog(
            content: Text("Password reset link sent! check your email in (spam box )"),
          );
         }
         );
      } on FirebaseAuthException catch (e) {
        print(e);
        showDialog(context: context,
         builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
         }
         );
      }
     
    }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color.fromARGB(226, 89, 84, 243),
        elevation: 0,
      ),
      body : Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32,bottom:5),
            child: Text("Enter your Email and We will send you a passward reset link"),
          ),

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? "Enter a valid email"
                    : null,
          ),
        ),
         MaterialButton(
            onPressed: passwordReset,
            color: const Color.fromARGB(226, 89, 84, 243),
            child: const Text("Reset Passward"),
          )
        ],
      )
    );
  }
}