// ignore_for_file: prefer_const_constructors
import "package:doctor/Admin/Screen/Dashbord/Widgets/AddDoctor.dart";
import "package:doctor/Admin/Screen/Dashbord/Widgets/Dashboardlist.dart";
import "package:doctor/Admin/Screen/Dashbord/Widgets/PatientList.dart";
import "package:doctor/Admin/Screen/Dashbord/Widgets/PaymentList.dart";
import "package:doctor/Responsive/responisve.dart";

import "package:doctor/Utlis/constant.dart";
import "package:doctor/Widget/Sidebar.dart";
import "package:doctor/Widget/drawerWidget.dart";
import "package:flutter/material.dart";
import "package:doctor/Widget/WebSidebar.dart";

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String button = "Dashboard";
  String PopbuttonValue = "";
  // ignore: non_constant_identifier_names
  late String DrawerSelector = "patient";
  void _updateSelectedUser(String user) {
    setState(() {
      DrawerSelector = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final cellWidth = screenWidth / 2 - 12; // subtracting padding
    final aspectRatio = cellWidth / 150; // 150 is the height of the cell
    return Scaffold(
      appBar: AppBar(
        shape: Responsive.isMobile(context)
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              )
            : null,
        title: const Text("Dashboard"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        actions: [
          if (Responsive.isMobile(context))
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  // Navigate to the second page
                  context,
                  MaterialPageRoute(builder: (context) => Sidebar()),
                );
              },
            ),
          CircleAvatar(
            backgroundColor: Colors.grey,
            child: Text("HT"),
          ),
          PopupMenuButton(
            onSelected: (value) => setState(() {
              PopbuttonValue = value;
            }),
            initialValue: PopbuttonValue,
            icon: Icon(Icons.more_vert),
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: LOGOUT,
                child: Text('LOGOUT'),
              ),
            ],
            offset: Offset(0, kToolbarHeight),
          ),
        ],
      ),
      drawer: Responsive.isMobile(context)
          ? drawerWidget(
              updateSelectedUser: _updateSelectedUser,
            )
          : null,
      body: Row(
        children: [
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (Responsive.isDesktop(context)) {
              return drawerWidget(
                updateSelectedUser: _updateSelectedUser,
              );
            } else {
              return Container();
            }
          }),
          Expanded(
            flex: 2,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              AspectRatio(
                aspectRatio: Responsive.isMobile(context) ? 2 : 4,
                child: SizedBox(
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                      childAspectRatio: Responsive.isMobile(context) ? 2 : 1,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Color.fromARGB(255, 216, 220, 221),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Text(
                                    "Patient",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text("TOTAL: 1233")
                                ],
                              ),
                              Stack(
                                alignment: Alignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  Icon(
                                    Icons.person,
                                    size: 45,
                                  ),
                                  SizedBox(
                                    width: 55,
                                    height: 55,
                                    child: CircularProgressIndicator(
                                      value: 0.3,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      DrawerSelector.toUpperCase(),
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddDoctor()));
                        },
                        child: Text("Add Doctor"))
                  ],
                ),
              ),
              Expanded(
                  child: Row(children: [
                if (DrawerSelector == "dashboard") Dashboardlist(),
                if (DrawerSelector == "patient") PatientList(),
                if (DrawerSelector == "payment") PaymentList(),
                if (DrawerSelector == "doctor") Dashboardlist(),
              ])),
            ]),
          ),
          LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            if (Responsive.isDesktop(context)) {
              return WebSidebar();
            } else {
              return Container();
            }
          }),
        ],
      ),
    );
  }
}
