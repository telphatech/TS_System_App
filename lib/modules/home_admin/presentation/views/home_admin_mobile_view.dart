import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';

// TODO: PRANJAL

class HomeAdminMobileView extends StatelessWidget {
  const HomeAdminMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TM System',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 48,
            color: Color.fromARGB(255, 157, 37, 116),
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 157, 37, 116),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 157, 37, 116),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/profilepic.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'John Williams',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Text(
                          'admin@telphatech.com',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              ListTile(
                leading: const Icon(Icons.dashboard, color: Colors.white),
                title: const Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 4),
              ListTile(
                leading: const Icon(Icons.check_box, color: Colors.white),
                title: const Text(
                  'Manage Employees',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
              const SizedBox(height: 4),
              ListTile(
                leading: const Icon(Icons.toggle_on, color: Colors.white),
                title: const Text(
                  'Manage Attendances',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
              const SizedBox(height: 4),
              ListTile(
                leading: const Icon(Icons.calendar_today_rounded,
                    color: Colors.white),
                title: const Text(
                  'Manage Leaves',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
              const SizedBox(height: 4),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
              const SizedBox(height: 4),
              ListTile(
                leading: const Icon(Icons.help, color: Colors.white),
                title: const Text(
                  'Help & Support',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
              const SizedBox(height: 200),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
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
