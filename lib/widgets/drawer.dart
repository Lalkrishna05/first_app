import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.teal,
        child: ListView(padding: EdgeInsets.zero, children: const [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("lalkrishna patel"),
                  accountEmail: Text("lalkrishna2205@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/lalu3.jpg"),
                  )
                  //Image.asset("assets/lalu.png")
                  )),
          ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  ))),
          ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email me",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.white,
                  )))
        ]));
  }
}
