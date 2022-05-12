import 'package:final_social_app/screens/comment.dart';
import 'package:final_social_app/screens/home_page.dart';
import 'package:final_social_app/screens/icon-first.dart';
import 'package:final_social_app/screens/profile_page.dart';
import 'package:final_social_app/screens/sign_up_page.dart';
import 'package:final_social_app/screens/spales.dart';
import 'package:final_social_app/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfilePage(),
      initialRoute: '${Routes.homepage}',
      routes: {
        Routes.spales: (context) => SplashScreen(),
        Routes.loginPage: (context) => LoginPage(),
        Routes.register: (context) => Signup(),
        Routes.firstpage: (context) => Firstpage(),
        Routes.homepage: (context) => HomePage(),
        Routes.comment: (context) => Comments(),
        Routes.bottomBarPage:(context)=>Firstpage(),
      },
    );
  }
}
