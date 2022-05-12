import 'dart:convert';

import 'package:final_social_app/repository/auth_repo.dart';
import 'package:final_social_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = GlobalKey<FormState>();
  bool ispasshide = true;
  List arrays = [];
  String name = '';
  String password = '';
  var isEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: Image.asset(
                "assets/social.png",
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                ),
                child: Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Username is not correct";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              name = value;
                            },
                            decoration: InputDecoration(
                              labelText: "Username",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              hintText: "Type your usrename",
                              prefixIcon: Icon(Icons.person_outline_outlined),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 40),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Password is not correct";
                              }
                              return null;
                            },
                            onChanged: (value) {
                              password = value;
                            },
                            obscureText: ispasshide,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(),
                              hintText: "Type your password",
                              prefixIcon: Icon(Icons.lock_outline),
                              suffixIcon: IconButton(
                                icon: Icon(ispasshide
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    ispasshide = !ispasshide;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          margin: EdgeInsets.only(right: 40),
                          child: Text("Forgot password?"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (formkey.currentState.validate()) 
                            {
                              Navigator.pushNamed(context, Routes.homepage);
                            }
                            loginFunc();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "LOGIN",
                              style: TextStyle(color: Colors.white),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                            ),
                          ),
                        ),
                         Column(
                          children: arrays.map((e) => Text("$e")).toList(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.register);
                            },
                            child: Text("Register"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 75),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/profil.png",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginFunc() async {
    http.Response res = await AuthRepo.loginApi(name: name, password: password);
    if (res != null) {
      print(res.body);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('TOKEN', response["data"]["token"]);
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(
              duration: const Duration(seconds: 2),
              content: Text("${response["message"]}"),
            ))
            .closed
            .then((SnackBarClosedReason reason) {
          Navigator.pushNamed(context, Routes.homepage);
        });
        print(res.body);
      } else if (res.statusCode == 400) {
        var data = jsonDecode(res.body);
        setState(() {
          arrays = data["data"]["error"];
        });
      }
    }
  }
}
