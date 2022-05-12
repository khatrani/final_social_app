// import 'dart:convert';
// import 'package:final_social_app/repository/auth_repo.dart';
// import 'package:final_social_app/utils/routes.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class Register extends StatefulWidget {
//   Register({Key key}) : super(key: key);

//   @override
//   _RegisterState createState() => _RegisterState();
// }

// class _RegisterState extends State<Register> {
//   List arrays = [];
//   String name = "";
//   String email = "";
//   String password = "";

//   final formkey = GlobalKey<FormState>();

//   bool ispasshide = true;

//   var isEmpty;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Opacity(
//               opacity: 1,
//               child: Image.asset(
//                 "assets/social.png",
//                 fit: BoxFit.cover,
//                 height: double.infinity,
//               ),
//             ),
//             Center(
//               child: Container(
//                 width: 350,
//                 height: 500,
//                 decoration: BoxDecoration(
//                   color: Colors.white60,
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(40),
//                   ),
//                 ),
//                 child: Form(
//                   key: formkey,
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 35),
//                     child: Column(
//                       children: [
//                         SizedBox(height: 20),
//                         Container(
//                           margin: EdgeInsets.only(left: 40, right: 40),
//                           child: TextFormField(
//                             onChanged: (value) {
//                               name = value;
//                               setState(() {});
//                             },
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return "Username is not correct";
//                               }
//                               return null;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Name",
//                               labelStyle: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                               border: OutlineInputBorder(),
//                               hintText: "Type your usrename",
//                               prefixIcon: Icon(Icons.person_outline_outlined),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           margin: EdgeInsets.only(left: 40, right: 40),
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return "Email is not correct";
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {
//                               email = value;
//                             },
//                             decoration: InputDecoration(
//                               labelText: "Email",
//                               labelStyle: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                               border: OutlineInputBorder(),
//                               hintText: "Type your usrename",
//                               prefixIcon: Icon(Icons.person_outline_outlined),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Container(
//                           margin: EdgeInsets.only(left: 40, right: 40),
//                           child: TextFormField(
//                             validator: (value) {
//                               if (value.isEmpty) {
//                                 return "Password is not correct";
//                               }
//                               return null;
//                             },
//                             onChanged: (value) {
//                               password = value;
//                             },
//                             obscureText: ispasshide,
//                             decoration: InputDecoration(
//                               labelText: "Password",
//                               labelStyle: TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                               border: OutlineInputBorder(),
//                               hintText: "Type your password",
//                               prefixIcon: Icon(Icons.lock_outline),
//                               suffixIcon: IconButton(
//                                 icon: Icon(ispasshide
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () {
//                                   setState(
//                                     () {
//                                       ispasshide = !ispasshide;
//                                     },
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         GestureDetector(
//                           onTap: () {
//                             if (formkey.currentState.validate()) {
//                               registerFun();
//                             }
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 30, vertical: 10),
//                             child: Text(
//                               "Register",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             decoration: BoxDecoration(
//                               color: Colors.blue,
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(15),
//                               ),
//                             ),
//                           ),
//                         ),
//                         // Column(
//                         //   children: arrays.map((e) => Text("$e")).toList(),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top: 30),
//                     child: Container(
//                       width: 90,
//                       height: 90,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage(
//                             "assets/profil.png",
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

// void registerFun() async {
//   http.Response res = await AuthRepo.registerApi(
//       name: name, email: email, password: password);
//   if (res != null) {
//     print(res.body);
//     if (res.statusCode == 200) {
//       var response = jsonDecode(res.body);

// SharedPreferences prefs = await SharedPreferences.getInstance();
// prefs.setString('TOKEN', response["data"]["token"]);
// ScaffoldMessenger.of(context)
//     .showSnackBar(
//       SnackBar(
//         duration: const Duration(seconds: 2),
//         content: Text("${response["message"]}"),
//       ),
//     )
//     .closed
//     .then((SnackBarClosedReason reason) {
//   Navigator.pushNamed(context, Routes.homepage);
// });
//   print(res.body);
// } else if (res.statusCode == 400) {
//   var data = jsonDecode(res.body);
//   setState(() {
//     arrays = data["data"]['error'];
//   });
//       }
//     }
//   }
// }

import 'dart:convert';
import 'package:final_social_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Signup extends StatefulWidget {
  const Signup({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Signup> {
  final formkey = GlobalKey<FormState>();

  List arrays = [];
  String mno = '';
  String pwd = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSG4zLm2PM-0plPymrbJMaZ8rm_HMd82Ce4J5Ncf8MGQoCYU_0Lukl7fTBPNcEjWyBLK4Q&usqp=CAU",
              fit: BoxFit.cover,
              height: double.infinity,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.homepage);
              },
              icon: Icon(Icons.arrow_back),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120, top: 50),
              child: Container(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 47, top: 110),
              child: Container(
                height: 480,
                width: 270,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 10, bottom: 10),
                        child: Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your correct mobileno";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mobile_screen_share),
                              labelText: "Mobil No",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Container(
                      //     child: TextFormField(
                      //       validator: (value) {
                      //         if (value.isEmpty) {
                      //           return "Enter your correct mobileno";
                      //         }
                      //         return null;
                      //       },
                      //       decoration: InputDecoration(
                      //         prefixIcon: Icon(Icons.lock),
                      //         labelText: "password",
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.all(
                      //             Radius.circular(20),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Container(
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Enter your correct mobileno";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock),
                              labelText: "Confirm password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formkey.currentState.validate()) {
                            registerfun();
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 90,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "sing up",
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          child: Row(
                            children: [
                              Text("Already have an Account ?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, Routes.homepage);
                                },
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void registerfun() async {
    http.Response res = await AuthRepo.registerApi(mno: mno, pwd: pwd);
    if (res != null) {
      print(res.body);
      if (res.statusCode == 200) {
        var response = jsonDecode(res.body);
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                content: Text("${response["message"]}"),
              ),
            )
            .closed
            .then((SnackBarClosedReason reason) {
          Navigator.pushNamed(context, Routes.homepage);
        });
      }
    }
  }
}

class RegisterUrl {
  static String baseuri = 'http://skydigitalcard.com/appservices/signup.php';
}

class AuthRepo {
  static Future registerApi({String mno, String pwd}) async {
    return await post(Uri.parse("${RegisterUrl.baseuri}"),
        body: {'mno': '$mno', 'pwd': '$pwd'});
  }
}
