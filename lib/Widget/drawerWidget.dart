import 'package:flutter/material.dart';

class drawerWidget extends StatefulWidget {
  final Function(String) updateSelectedUser;
  const drawerWidget({required this.updateSelectedUser});

  @override
  State<drawerWidget> createState() => _drawerWidgetState();
}

class _drawerWidgetState extends State<drawerWidget> {
  String DrawerSelector = "patient";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromRGBO(96, 125, 139, 1),
      // ignore: prefer_const_literals_to_create_immutables
      child: Column(children: [
        DrawerHeader(
          child: Icon(Icons.local_hospital, size: 100),
        ),
        ListTile(
          selected: DrawerSelector == "dashboard",
          leading: Icon(Icons.home),
          title: Text("D A S H B O A R D"),
          onTap: () {
            setState(() {
              DrawerSelector = "dashboard";
            });
            widget.updateSelectedUser(DrawerSelector);
          },
        ),
        ListTile(
          selected: DrawerSelector == "doctor",
          leading: Icon(Icons.local_hospital),
          title: Text("D O C T O R"),
          onTap: () {
            setState(() {
              DrawerSelector = "doctor";
            });
            widget.updateSelectedUser(DrawerSelector);
          },
        ),
        ListTile(
          selected: DrawerSelector == "patient",
          leading: Icon(Icons.person),
          title: Text("P A T I E N T"),
          onTap: () {
            setState(() {
              DrawerSelector = "patient";
            });
            widget.updateSelectedUser(DrawerSelector);
          },
        ),
        ListTile(
          selected: DrawerSelector == "payment",
          leading: Icon(Icons.payment),
          title: Text("P A Y M E N T"),
          onTap: () {
            setState(() {
              DrawerSelector = "payment";
            });
            widget.updateSelectedUser(DrawerSelector);
          },
        ),
        // ListTile(
        //   selected: DrawerSelector == "feedback",
        //   leading: Icon(Icons.feedback),
        //   title: Text("F E E D B A C K"),
        //   onTap: () {
        //     setState(() {
        //       DrawerSelector = "feedback";
        //     });
        //     widget.updateSelectedUser(DrawerSelector);
        //   },
        // ),
        ListTile(
          selected: DrawerSelector == "appointment",
          leading: Icon(Icons.calendar_view_day),
          title: Text("A P P O I N T M E N T S"),
          onTap: () {
            setState(() {
              DrawerSelector = "appointment";
            });
            widget.updateSelectedUser(DrawerSelector);
          },
        ),
      ]),
    );
  }
}
