import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uia_app/services/shared_service.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color activeColor = Color(0xFFe0f4f0);
  Color inactiveColor = Color(0xFFfafafa);
  Color textColor = Color(0xFF000000);
  Color iconClr = Colors.teal;

  List<bool> selected_opt = [
    false,
    false,
    false,
    false,
  ];

  set_opt(int i) {
    for (int k = 0; k < selected_opt.length; k++) {
      if (k == i)
        selected_opt[k] = true;
      else
        selected_opt[k] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'Faizan ',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFFfafafa),
                  fontWeight: FontWeight.w400),
            ),
            accountEmail: Text(
              "choudharyfaizan15@gmail.com",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFfafafa),
                fontWeight: FontWeight.w500,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                  child: Center(
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              )),
            ),
          ),
          // ListTile(
          //   tileColor: inactiveColor,
          //   selected: selected_opt[0],
          //   selectedTileColor: activeColor,
          //   leading: Icon(
          //     FontAwesomeIcons.house,
          //     color: iconClr,
          //     size: 24,
          //   ),
          //   title: Text('Home'),
          //   onTap: () {
          //     if (!selected_opt[0]) {
          //       setState(() {
          //         textColor = Color(0xFF000000);
          //         set_opt(0);
          //         Navigator.pushNamed(context, '/');
          //       });
          //     }
          //   },
          // ),
          ListTile(
            title: Text('Logout'),
            onTap: () {
              setState(() {
                textColor = Color(0xFF000000);
                set_opt(0);
                SharedService.logout(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
