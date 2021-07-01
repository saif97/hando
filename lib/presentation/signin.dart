import 'package:flutter/material.dart';

import 'home.dart';
import 'signup.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.4,
                child: Image.asset(
                  "assets/logo.png",
                  width: 300,
                  height: 300,
                ),
              ),
              SizedBox(
                child: Container(
                    height: 1,
                    color: Colors.grey[700],
                    width: MediaQuery.of(context).size.width * 0.4),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.09),
              Text("Insert Something About the Application"),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: email,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Email",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 50),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          obscureText: true,
                          style: TextStyle(color: Colors.black),
                          controller: password,
                          decoration: InputDecoration(
                            hintText: "Password",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: ElevatedButton(
                  onPressed: () async {
                  },
                  child: Text(
                    "Log In",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Register for a new Account",
                    style: TextStyle(color: Colors.black87),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
