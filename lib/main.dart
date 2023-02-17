import 'dart:convert';
import './home.dart';
import 'package:flutter/material.dart';
import './api.dart';
import 'package:http/http.dart' as http;
import './register.dart';
import './spider.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Login Local Server",
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String apiUrl = Api.url;

  String msgError = "";

  getApi(String username, String password) async {
    final res = await http
        .post(apiUrl, body: {"username": username, "password": password});
    final data = jsonDecode(res.body);

    if (data['level'] == "admin") {
      print(" Votre Status : " + data['level']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => HomePage(
                username: data['username'],
                data: data['level'],
              )));

      _username.clear();
      _password.clear();
      setState(() {
        msgError = "";
      });
    } else if (data['level'] == "user") {
      print(data['msg'] + " Votre Status : " + data['level']);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (c) => HomePage(
                username: data['username'],
                data: data['level'],
              )));
      _username.clear();
      _password.clear();
      setState(() {
        msgError = "";
      });
    } else {
      setState(() {
        msgError = "Password/Username Incorrect";
      });
    }
  }

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          backgroundColor: Color.fromARGB(255, 48, 137, 227),
          elevation: 0.5,
          actions: <Widget>[
            FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text("Register"),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 7, 218, 255),
                        Color.fromARGB(255, 30, 105, 233)
                      ]),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    controller: _username,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Username",
                        hintText: "Username"),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color.fromARGB(255, 7, 218, 255),
                        Color.fromARGB(255, 30, 105, 233)
                      ]),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: TextField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Password",
                        hintText: "Password"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Material(
                  borderRadius: BorderRadius.circular(20.0),
                  elevation: 10.0,
                  color: Color.fromARGB(255, 30, 105, 233),
                  child: MaterialButton(
                    onPressed: () {
                      getApi(_username.text, _password.text);
                    },
                    color: Color.fromARGB(255, 53, 120, 235),
                    child: Text("LOGIN"),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(msgError, style: TextStyle(color: Colors.red)),
                )
              ],
            ),
          ),
        ));
  }
}
