import 'package:final_social_app/screens/profile_page.dart';
import 'package:final_social_app/screens/search_page.dart';
import 'package:flutter/material.dart';
import 'favourite_page.dart';
import 'home_page.dart';

class Firstpage extends StatefulWidget {
  Firstpage({Key key}) : super(key: key);

  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  int currentIndex = 0;
  Color currentColor = Colors.blueAccent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: bottem(),
      ),
      bottomNavigationBar: Container(
        child: BottomAppBar(
          color: Colors.white54,
          child: Row(
            children: [
              menuItem(text: "Home", icon: Icons.home, index: 0),
              menuItem(text: "Search", icon: Icons.search, index: 1),
              menuItem(text: "Favourite", icon: Icons.favorite, index: 2),
              menuItem(text: "Profile", icon: Icons.person, index: 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  menuItem({text, icon, index, color}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: Icon(
                icon,
                color: currentIndex == index ? currentColor : Colors.black,
              ),
            ),
            Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  bottem() {
    switch (currentIndex) {
      case 0:
        return HomePage();
        break;
      case 1:
        return SearchPage();
        break;
      case 2:
        return FavouritePage();
        break;
      case 3:
        return ProfilePage();
        break;
      default:
    }
  }
}
