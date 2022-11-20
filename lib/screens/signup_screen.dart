import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isAPIcallProcess = false; // loader during API call
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey =
      GlobalKey<FormState>(); // to maintain state of form
  String? username;
  String? password;
  String? email;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        body: ProgressHUD(
          key: UniqueKey(),
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          child: Form(
            child: _signUpUI(context),
          ),
        ),
      ),
    );
  }

  Widget _signUpUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(400),
                  bottomRight: Radius.circular(400),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logos/logo.png',
                      width: 150,
                      height: 150,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / 15,
                left: MediaQuery.of(context).size.width / 10,
                bottom: 10,
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 10,
                bottom: 20,
              ),
              child: const Text(
                'Let\'s get started!',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Form(
              key: globalFormKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => username = input,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (input) => username = input,
                      validator: (input) => !input!.contains('@')
                          ? 'Email Id should be valid'
                          : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: TextFormField(
                      obscureText: hidePassword,
                      onSaved: (input) => password = input,
                      validator: (input) => input!.length < 3
                          ? 'Password should be more than 3 characters'
                          : null,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          color: Colors.teal,
                          icon: Icon(hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 1.75,
                      child: Material(
                        borderRadius: BorderRadius.circular(20),
                        shadowColor: Colors.tealAccent,
                        color: Colors.teal,
                        elevation: 7,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Center(
              child: Text(
                "OR",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.75,
                child: Material(
                  borderRadius: BorderRadius.circular(20),
                  shadowColor: Colors.blueAccent,
                  color: Colors.blue,
                  elevation: 7,
                  child: GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width / 16),
                        const Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        const Center(
                          child: Text(
                            'Sign Up with Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
