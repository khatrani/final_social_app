import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_social_app/utils/routes.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 600,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("editpro")
                    .snapshots(),
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return new Text("loading....");
                  }
                  return ListView(
                      children: snapshots.data.docs
                          .map<Widget>((DocumentSnapshot document) {
                    return profile(context, document);
                  }).toList());
                }),
          ),
        ],
      ),
    );
  }

  Widget profile(context, document) {
    return Column(
      children: [
        Container(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage("${document['coverphoto']}"),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.bottomBarPage);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          builder: (context) => Column(
                            children: [
                              Text("Setting"),
                              Text("Log Out"),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.menu),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 160,
                top: 140,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${document['postphoto']}"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                  ),
                  height: 100,
                  width: 100,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "${document['follower']}.",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Followers",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "${document['following']}",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${document['user']}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Text(
              "${document['text']}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Post",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            // Column(
            //   children: [
            //     Container(
            //       height: 270,
            //       width: double.infinity,
            //       color: Colors.black,
            //       child: StaggeredGridView.countBuilder(
            //         crossAxisCount: 2,
            //         itemBuilder: (context, index) => Container(
            //           height: 100,
            //           width: 300,
            //           decoration: BoxDecoration(
            //             color: Colors.grey,
            //             image: DecorationImage(
            //                 image: NetworkImage("${document['propic']}"),
            //                 fit: BoxFit.cover),
            //           ),
            //         ),
            //         staggeredTileBuilder: (int index) =>
            //             StaggeredTile.count(1, index.isEven ? 1 : 2),
            //         mainAxisSpacing: 8.0,
            //         crossAxisSpacing: 8.0,
            //       ),
            //     ),
            //   ],
            // )
          ],
        )
      ],
    );
  }
}
