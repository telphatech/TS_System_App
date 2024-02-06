import 'package:flutter/material.dart';
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart';

// TODO: NIKITA

class HomeEmployeeMobileView extends StatelessWidget {
  const HomeEmployeeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.pink[900],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(''),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "John Williams",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "admin@telphatech.com",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                accountEmail: Text(""),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.1),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.dashboard, color: Colors.white),
                title: Text('Dashboard', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.white),
                title: Text('Timesheet', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              ListTile(
                leading:
                    Icon(Icons.assignment_turned_in_sharp, color: Colors.white),
                title:
                    Text('Attendance', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.assignment, color: Colors.white),
                title: Text('Leave', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white),
                title: Text('Settings', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.white),
                title: Text('Help and Support',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
              SizedBox(height: 140),
              Divider(color: Colors.grey),
              ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashScreenMobileView()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
