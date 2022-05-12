import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_gradient_text/easy_gradient_text.dart';
import 'package:final_social_app/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool liked = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SafeArea(
                    child: Container(
                      child: GradientText(
                        text: ("Collaction"),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        colors: [Colors.blue, Colors.red],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 190, top: 20),
                  child: Icon(Icons.share),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 310),
              child: Text(
                "Trending",
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 90,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("delta")
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return new Text("Loading..");
                    }
                    return ListView(
                        scrollDirection: Axis.horizontal,
                        children: snapshots.data.docs
                            .map<Widget>((DocumentSnapshot document) {
                          return story(document);
                        }).toList());
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("others")
                      .snapshots(),
                  builder: (context, snapshots) {
                    if (!snapshots.hasData) {
                      return new Text("loading....");
                    }
                    return ListView(
                        children: snapshots.data.docs
                            .map<Widget>((DocumentSnapshot document) {
                      return postphotos(document);
                    }).toList());
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget story(document) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 8,
            ),
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 2),
                image: DecorationImage(
                  image: NetworkImage("${document['post']}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "${document['name']}",
          style: TextStyle(fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Widget postphotos(document) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.redAccent, width: 2),
                color: Colors.black,
                image: DecorationImage(
                    image: NetworkImage("${document['posturl']}"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${document['user']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${document['location']}"),
              ],
            ),
            Spacer(),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              liked = !liked;
            });
          },
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent, width: 2),
              color: Colors.blue,
              image: DecorationImage(
                  image: NetworkImage("${document['socialurl']}"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        liked = !liked;
                      });
                    },
                    icon: liked
                        ? Icon(Icons.favorite_outline)
                        : Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.comment);
                    },
                    icon: Icon(Icons.chat_bubble_outline_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.near_me_outlined,
                    ),
                  ),
                  SizedBox(
                    width: 190,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_outline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
