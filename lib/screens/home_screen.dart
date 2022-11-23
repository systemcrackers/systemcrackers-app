import 'package:flutter/material.dart';
import 'package:uia_app/screens/dyslexia_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        color: Colors.teal[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildCard(1, "./assets/icons/test.png", "Take a diagnostic test",
                  "Diagnostics tests are blah blah", context),
              BuildCard(2, "./assets/icons/report.png", "View Past reports", "Other text", context),
              BuildCard(3, "./assets/icons/specialist.jpg", "Consult a specialist",
                  "Specialists are blah blah", context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}

Widget BuildCard(
    int key, String imgUrl, String title, String desc, BuildContext context) {
  return Card(
    clipBehavior: Clip.antiAlias,
    margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundImage: Image.asset(imgUrl).image,
                radius: 35,
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 14.0,
              left: 16.0,
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
                overflow: TextOverflow.visible,
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Text(
            desc,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 16.0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                switch (key) {
                  case 1:
                    Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const DyslexiaScreen())
                    );
                    break;
                  case 2:
                    // Navigator.push(context,
                    //   MaterialPageRoute(
                    //       builder: (context) => ReducingMultiTasking()),
                    // );
                    break;
                  case 3:
                    // Navigator.push(context,
                    //   MaterialPageRoute(
                    //       builder: (context) => Player()),
                    // );
                    break;
                }
              },
              color: Color(0xFFFEBD40),
              iconSize: 30.0,
              icon: Icon(Icons.arrow_forward_rounded),
              alignment: Alignment.topLeft,
            ),
            SizedBox(width: 12.0),
          ],
        )
      ],
    ),
  );
}


Widget bottomNav() {
  return BottomNavigationBar(
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.person),
      //   label: 'Profile',
      // ),
      BottomNavigationBarItem(
        icon: Icon(Icons.lightbulb_rounded),
        label: 'Know More',
      ),
    ],
    currentIndex: 0,
    selectedItemColor: Colors.amber[800],
  );
}