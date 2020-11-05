import 'package:control_escolar/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  SideMenu();

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      width: MediaQuery.of(context).size.width * 0.75,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    const Divider(),
                    ListTile(
                      leading: const Icon(
                        Icons.exit_to_app,
                        size: 20,
                      ),
                      title: Text("Cerrar sesión"),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageContainer(String link) {
    if (link.contains('http://') || link.contains('https://')) {
      return Image.network(
        link,
        fit: BoxFit.cover,
      );
    }
    return Image.asset(
      link,
      fit: BoxFit.cover,
    );
  }
}
