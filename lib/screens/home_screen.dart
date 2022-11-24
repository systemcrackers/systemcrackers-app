import 'package:flutter/material.dart';
import 'package:uia_app/screens/dyslexia_screen.dart';
import 'package:uia_app/screens/know_more_screen.dart';
import '../utils/hamburger_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  final pages = [
    const HomeScreen(),
    KnowMoreScreen(),
  ];

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
        actions: [
          Icon(Icons.person),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        ],
      ),
      drawer: NavBar(),
      body: Container(
        color: Colors.teal[100],
        child: SingleChildScrollView(
          child: Column(
            children: [
              BuildCard(1, "./assets/icons/test.png", "Take a diagnostic test",
                  "Diagnostics tests are blah blah", context),
              BuildCard(2, "./assets/icons/report.png", "View Past reports",
                  "Other text", context),
              BuildCard(3, "./assets/icons/specialist.jpg",
                  "Consult a specialist", "Specialists are blah blah", context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => KnowMoreScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.lightbulb,
                color: Colors.white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DyslexiaScreen()));
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
