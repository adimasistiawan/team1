import 'package:flutter/material.dart';
import 'package:myteam_2/ui/pages/menu/dashboard/dashboard.dart';
import 'package:myteam_2/ui/pages/menu/teamview/teamview.dart';
import 'package:myteam_2/ui/widgets/menu/listmenu.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListMenu(
                    text: "Dashboard",
                    redirect: DashboardPage(),
                    icon: Icons.dashboard,
                  ),
                  ListMenu(
                    text: "Team View",
                    redirect: TeamViewPage(),
                    icon: Icons.person_search,
                  ),
                  ListMenu(
                    text: "Dashboard",
                    redirect: DashboardPage(),
                    icon: Icons.dashboard,
                  )
                ],
              )
            ],
          ))
    ]);
  }
}
