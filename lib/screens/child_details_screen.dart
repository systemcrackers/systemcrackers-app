import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:uia_app/services/api_service.dart';
import '../models/child_details_request_model.dart';

import '../services/google_signin_api.dart';
import '../utils/config.dart';

class ChildDetails extends StatefulWidget {
  const ChildDetails({super.key});

  @override
  State<ChildDetails> createState() => _ChildDetailsState();
}

class _ChildDetailsState extends State<ChildDetails> {
  bool isAPIcallProcess = false; // loader during API call
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey =
      GlobalKey<FormState>(); // to maintain state of form
  String? name;
  String? sex;
  String? dob;
  String? country;
  List gender = ["MALE", "FEMALE"];
  TextEditingController dateInput = TextEditingController();

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
      scrollDirection: Axis.vertical,
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
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 15,
              left: MediaQuery.of(context).size.width / 10,
              bottom: 10,
            ),
            child: const Text(
              'Child Details',
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
              'Enter details of your child.',
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
                      if (onValidate!.isEmpty) {
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
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Gender",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.teal,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      addRadioButton(0, "Male"),
                      addRadioButton(1, "Female")
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ),
                  child: FormHelper.inputFieldWidget(
                    context,
                    "country",
                    "Country",
                    (onValidate) {
                      if (onValidate!.isEmpty) {
                        return "Please enter country";
                      }
                      return null;
                    },
                    (onSaved) {
                      country = onSaved;
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
                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10,
                    right: MediaQuery.of(context).size.width / 10,
                  ),
                  child: TextField(
                    controller: dateInput,
                    decoration: InputDecoration(
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.teal,
                        ),
                        labelText: "Enter date of birth."),
                    readOnly: true,
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      }
                    },
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

                            ChildDetailsRequestModel model =
                                ChildDetailsRequestModel(
                              dob: dob,
                              name: name,
                              sex: sex,
                            );

                            APIService.child(model).then(
                              (response) => {
                                setState(() {
                                  isAPIcallProcess = false;
                                }),
                                if (response != null)
                                  {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/home',
                                      (route) => false,
                                    )
                                  }
                              },
                            );
                          }
                        },
                        child: const Center(
                          child: Text(
                            'SUBMIT',
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
        ],
      ),
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

  Row addRadioButton(int btnValue, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Radio(
          activeColor: Theme.of(context).primaryColor,
          value: gender[btnValue],
          groupValue: sex,
          onChanged: (value) {
            setState(() {
              print(value);
              sex = value;
            });
          },
        ),
        Text(title)
      ],
    );
  }
}
