import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswardController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswardController.dispose();
    super.dispose();
  }

  Future signUp() async {
   if (passwardconfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    }
  }

  bool passwardconfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswardController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        //image or Any text fo user guidence.
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            "assets/images/health-report.png",
            // fit: BoxFit.cover,
            height: 150,
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.025,
          // width: MediaQuery.of(context).size.width * 0.5,
        ),
        const Text(
          "Your Welcome",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        // text 2
        const Text(
          "Register below with your details!",
          style: TextStyle(
            fontSize: 18,
            // fontWeight: FontWeight.w400,
          ),
        ),

        //email textfeild
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, top: 4, bottom: 5),
          child: TextFormField(
            controller: _emailController,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: "Enter email id",
              labelText: "Email id",
              // iconColor:Color.fromARGB(255, 96, 96, 197),
            ),
            /*validator: (value) {
                if (value!.isEmpty) {
                  return "email id can not be empty";
                }
                return null;
              },*/
          ),
        ),

        //passward textfeild
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
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
        // confirm passward
       Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, bottom: 16),
          child: TextFormField(
            controller: _confirmpasswardController,
            obscureText: true,
            decoration: const InputDecoration(
              hintText: "Confirm Passward",
              labelText: "Confirm passward",
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
        //sign up
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
              "Sign Up",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: signUp,
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),

        //not a user ? Register
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("You have an account, ", style: TextStyle(fontSize: 18)),
          GestureDetector(
            onTap: widget.showLoginPage,
            child: const Text("Login Here",
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
                label: const Text("Google"),
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
                label: const Text("Facbook"),
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
