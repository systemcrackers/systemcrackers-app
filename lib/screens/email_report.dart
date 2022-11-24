import 'package:flutter/material.dart';

class EmailReport extends StatefulWidget {
  const EmailReport({super.key});

  @override
  State<EmailReport> createState() => _EmailReportState();
}

class _EmailReportState extends State<EmailReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text(
          'Report',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 60, left: 50, right: 50),
        child: Column(
          children: [
            Center(
              child: Text(
                'A report has been generated on the basis of your answers and inputs from the tests you have taken.',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'A copy of the report has been sent to your email address too.',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // ADD LINK
                Navigator.pop(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: const Text(
                  'View Report',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/text_to_speech');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                child: const Text(
                  'Proceed to Learning',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
