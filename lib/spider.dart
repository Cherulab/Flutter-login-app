import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './api.dart';
import 'dart:convert';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Local Server",
    home: ProgPage(),
  ));
}

class ProgPage extends StatefulWidget {
  @override
  _ProgPage createState() => _ProgPage();
}

class _ProgPage extends State<ProgPage> {
  String spiderUrl = Api.urlspider;

  String msg = "";

  getApi(String ref, String name) async {
    final res = await http.post(spiderUrl, body: {"ref": ref, "name": name});
    final data = jsonDecode(res.body);

    print(data['msg'] + " Votre Status : " + data['name']);
    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(20.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            Container(
              child: Text('Hello toi'),
            )
          ],
        ),
      ),
    ));
  }
}
