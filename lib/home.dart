import 'package:flutter/material.dart';
import './spider.dart';

class HomePage extends StatelessWidget {
  final String username, data;

  HomePage({this.username, this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Home Page " + data),
          backgroundColor: Colors.pink,
          elevation: 0.5),
      body: ListView(
        children: [Text('Bonjour ' + username + '  Votre Status : ' + data)],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Color.fromARGB(0, 0, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Home
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgPage()),
                );
              },
              icon: const Icon(
                Icons.add_alert_rounded,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            // PROGRAMMES
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ProgDetail()),
                // );
              },
              icon: const Icon(
                Icons.list,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            // MAP
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const MapRoute()),
                // );
              },
              icon: const Icon(
                Icons.map,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            // SETTINGS
            IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const Login()),
                // );
              },
              icon: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
