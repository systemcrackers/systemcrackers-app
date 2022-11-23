import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:uia_app/models/login_request_model.dart';
import 'package:uia_app/services/api_service.dart';

import '../services/google_signin_api.dart';
import '../utils/config.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAPIcallProcess = false; // loader during API call
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey =
      GlobalKey<FormState>(); // to maintain state of form
  String? email;
  String? password;

  @override
  void initState() {
    super.initState();
  }

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
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  Widget _loginUI(BuildContext context) {
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
                'Login',
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
                'Welcome back!',
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
                      onSaved: (input) => email = input,
                      validator: ((value) =>
                          value!.isEmpty ? "Email is required" : null),
                      // validator: (input) => !input!.contains('@')
                      //     ? 'Email Id should be valid'
                      //     : null,
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
                      validator: (input) {
                        if (input!.length < 3) {
                          return 'Password should be more than 3 characters';
                        } else if (input.isEmpty) {
                          return 'Password is required';
                        } else {
                          return null;
                        }
                      },
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
                  const SizedBox(height: 5),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: MediaQuery.of(context).size.width / 10,
                        top: 5,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            color: Colors.teal,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
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
                        child: ElevatedButton(
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                isAPIcallProcess = true;
                              });

                              // LoginBody data = {
                              //   email: email!,
                              //   password: password!,
                              // } as LoginBody;

                              LoginRequestModel model =
                                  LoginRequestModel(
                                    email: email!,
                                    password: password!,
                                  );

                              APIService.login(model).then((response) => {
                                    setState(() {
                                      isAPIcallProcess = false;
                                    }),
                                    if (response)
                                      {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          '/child',
                                          (route) => false,
                                        )
                                      }
                                    else
                                      {
                                        print("Hello"),
                                        FormHelper.showSimpleAlertDialog(
                                          context,
                                          Config.appName,
                                          "Invalid Email/Password!",
                                          "OK",
                                          () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      }
                                  });
                            }
                          },
                          child: const Center(
                            child: Text(
                              'LOGIN',
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
                    onTap: () {
                      // signInGoogle;
                    },
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
                            'Sign In with Google',
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
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                          color: Colors.teal[500],
                          fontWeight: FontWeight.w400,
                          // decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: Colors.teal[500],
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/register');
                          },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
    );
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future signInGoogle() async {
    await GoogleSignInApi.signIn();
  }
}
