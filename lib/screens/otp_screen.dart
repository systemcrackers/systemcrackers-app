import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        body: Form(
          child: OtpUI(context),
        ),
      ),
    );
  }

  Widget OtpUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 15,
              left: MediaQuery.of(context).size.width / 10,
              bottom: 10,
            ),
            child: const Text(
              'Verify OTP',
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
              right: MediaQuery.of(context).size.width / 10,
              bottom: 20,
            ),
            child: const Text(
              'An OTP has been sent to your email id. Please enter the OTP to continue.',
              style: TextStyle(
                color: Colors.teal,
                fontSize: 16,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 10,
              right: MediaQuery.of(context).size.width / 10,
            ),
            child: Row(
              children: [
                _textFieldOTP(true, false),
                SizedBox(width: MediaQuery.of(context).size.width / 23.25),
                _textFieldOTP(true, false),
                SizedBox(width: MediaQuery.of(context).size.width / 23.25),
                _textFieldOTP(true, false),
                SizedBox(width: MediaQuery.of(context).size.width / 23.25),
                _textFieldOTP(true, false),
                SizedBox(width: MediaQuery.of(context).size.width / 23.25),
                _textFieldOTP(true, false),
                SizedBox(width: MediaQuery.of(context).size.width / 23.25),
                _textFieldOTP(true, false),
              ],
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Verify'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3,
                  vertical: 15,
                ),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _textFieldOTP(bool first, last) {
    return Container(
      height: 80,
      child: AspectRatio(
        aspectRatio: 0.5,
        child: TextField(
          autofocus: true,
          onChanged: (value) => {
            if (value.length == 1 && last == false)
              {FocusScope.of(context).nextFocus()},
            if (value.length == 1 && first == false)
              {FocusScope.of(context).previousFocus()}
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal[600]!,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.teal,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
