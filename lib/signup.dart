import 'package:flutter/material.dart';

import 'home.dart';
import 'signin.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
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
              SizedBox(height: 40,),
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
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              Container(
                width:  MediaQuery.of(context).size.width * 0.8,
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: firstName,
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "First Name",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.35,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: lastName,
                                decoration: InputDecoration(
                                  hintText: "Last Name",
                                ),
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        controller: email,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: "Email Address",
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
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Text(
                    "Register",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  child: Text("Already Have an Account", style: TextStyle(color: Colors.black87),))
            ],
          ),
        ),
      ),
    );
  }
}
