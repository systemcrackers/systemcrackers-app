import 'package:flutter/material.dart';

class AutismHomeScreen extends StatefulWidget {
  const AutismHomeScreen({required this.pred, super.key});
  final String pred;

  @override
  State<AutismHomeScreen> createState() => _AutismHomeScreenState();
}

class _AutismHomeScreenState extends State<AutismHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text(
          'Diagnostic Tests',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(flex: 2), //2/6
                    Center(
                      child: Text(
                        "Now it's time to take the test!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    // Text("The PHQ-9 is a multipurpose instrument for screening, diagnosing, monitoring and measuring the severity of depression. This easy to use patient questionnaire is a self-administered version of the PRIME-MD (Primary Care Evaluation of Mental Disorders) diagnostic instrument for common mental disorders. This analysis will help us guide you further. Please answer over the last 2 weeks, how often have you been bothered by the following problems?"),
                    // Spacer(), // 1/6
                    Spacer(), // 1/6
                    InkWell(
                      onTap: () =>  Navigator.pushNamed(context, '/autism'),
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15), // 15
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.teal[400]!,
                              Colors.teal[700]!,
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Text(
                          "Start Test",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: Colors.black),
                        ),
                      ),
                    ),
                    Spacer(flex: 2), // it will take 2/6 spaces
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
