import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:uia_app/models/register_request_model.dart';
import 'package:uia_app/screens/otp_screen.dart';

import '../models/login_request_model.dart';
import '../services/api_service.dart';
import '../services/google_signin_api.dart';
import '../utils/config.dart';

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
  String? name;
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
                    child: FormHelper.inputFieldWidget(
                      context,
                      "name",
                      "Name",
                      (onValidate) {
                        if (onValidate.isEmpty) {
                          return "Please enter name";
                        }
                        return null;
                      },
                      (onSaved) {
                        name = onSaved;
                      },
                      initialValue: "",
                      borderFocusColor: Colors.teal,
                      borderColor: Colors.teal[600]!,
                      hintColor: Colors.teal,
                      borderRadius: 20,
                      borderWidth: 2,
                      paddingLeft: 10,
                      paddingRight: 15,
                      paddingBottom: 5,
                      paddingTop: 5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: FormHelper.inputFieldWidget(
                      context,
                      "email",
                      "Email",
                      (onValidate) {
                        if (onValidate.isEmpty && !onValidate.contains('@')) {
                          return "Please enter valid email";
                        }
                        return null;
                      },
                      (onSaved) {
                        email = onSaved;
                      },
                      initialValue: "",
                      borderFocusColor: Colors.teal,
                      borderColor: Colors.teal[600]!,
                      hintColor: Colors.teal,
                      borderRadius: 20,
                      borderWidth: 2,
                      paddingLeft: 10,
                      paddingRight: 15,
                      paddingBottom: 5,
                      paddingTop: 5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      right: MediaQuery.of(context).size.width / 10,
                    ),
                    child: FormHelper.inputFieldWidget(
                      context,
                      "password",
                      "Password",
                      (onValidate) {
                        if (onValidate.isEmpty) {
                          return "Please enter password";
                        } else if (onValidate.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                      (onSaved) {
                        password = onSaved;
                      },
                      initialValue: "",
                      borderFocusColor: Colors.teal,
                      borderColor: Colors.teal[600]!,
                      hintColor: Colors.teal,
                      borderRadius: 20,
                      borderWidth: 2,
                      paddingLeft: 10,
                      paddingRight: 15,
                      paddingBottom: 5,
                      paddingTop: 5,
                      obscureText: hidePassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.teal,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
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
                        child: FormHelper.submitButton(
                          btnColor: Colors.teal,
                          borderColor: Colors.teal,
                          "Sign Up",
                          () {
                            if (validateAndSave()) {
                              setState(() {
                                isAPIcallProcess = true;
                              });

                              // RegisterBody data = {
                              //   name: name,
                              //   email: email,
                              //   password: password,
                              // } as RegisterBody;

                              RegisterRequestModel model = RegisterRequestModel(
                                name: name,
                                email: email,
                                password: password,
                                // body: data,
                              );

                              // print(name);
                              // print(email);
                              print(password);

                              APIService.register(model).then(
                                (response) => {
                                  setState(() {
                                    isAPIcallProcess = false;
                                  }),
                                  // print(response.data),
                                  if (response.data != null)
                                    {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        Config.appName,
                                        "Registration Successful. Please verify your email.",
                                        "OK",
                                        () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const OTPScreen(),
                                            ),
                                          );
                                        },
                                      )
                                    }
                                  else
                                    {
                                      FormHelper.showSimpleAlertDialog(
                                        context,
                                        Config.appName,
                                        response.message,
                                        "OK",
                                        () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    }
                                },
                              );
                            }
                          },
                          // child const Center(
                          //   child: Text(
                          //     'SIGN UP',
                          //     style: TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //       fontFamily: 'Montserrat',
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
                      signUpGoogle;
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future signUpGoogle() async {
    await GoogleSignInApi.signIn();
  }
}
