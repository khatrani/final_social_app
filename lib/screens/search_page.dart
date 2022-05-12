import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(231, 244, 108, 54),
    );
  }
}




// import 'package:easy_gradient_text/easy_gradient_text.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:social_media_app/utils/route_config.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // CollectionReference _storys = FirebaseFirestore.instance.collection("story");
//   bool liked = true;
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 5),
//           child: Column(
//             children: [
//               _header(),
//               SizedBox(height: 5),
//               Container(
//                 height: 90,
//                 child: StreamBuilder(
//                     stream: FirebaseFirestore.instance
//                         .collection("story")
//                         .snapshots(),
//                     builder: (context, snapshots) {
//                       if (!snapshots.hasData) {
//                         return new Text("Loading..");
//                       }
//                       return ListView(
//                           scrollDirection: Axis.horizontal,
//                           children: snapshots.data.docs
//                               .map<Widget>((DocumentSnapshot document) {
//                             return _storyTile(document);
//                           }).toList());
//                     }),
//               ),

//               SizedBox(height: 10),
//               Expanded(
//                 child: Container(
//                   height: 300,
//                   child: StreamBuilder(
//                     stream: FirebaseFirestore.instance
//                         .collection("profile")
//                         .snapshots(),
//                     builder: (context, snapshots) {
//                       if (!snapshots.hasData) return new Text("Loading...");
//                       return ListView(
//                           children: snapshots.data.docs
//                               .map<Widget>((DocumentSnapshot document) {
//                         return _postProfile(document);
//                       }).toList());
//                     },
//                   ),
//                 ),
//               )

//               // Expanded(
//               //   child: ListView.builder(itemBuilder: (context, index) {
//               //     return _postProfile();
//               //   }),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _header() => Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               GradientText(
//                 colors: <Color>[Color(0xffee0000), Color(0xffeeee00)],
//                 text: 'Collaction',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//               IconButton(
//                 icon: Icon(Icons.message),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           Container(
//             width: double.infinity,
//             child: Text(
//               "Trending",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           )
//         ],
//       );

//   Widget _storyTile(document) {
//     return Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(right: 10),
//           height: 65,
//           width: 65,
//           decoration: BoxDecoration(
//             color: Colors.grey,
//             shape: BoxShape.circle,
//             border: Border.all(width: 2, color: Colors.green),
//             image: DecorationImage(
//                 image: NetworkImage("${document['storyurl']}"),
//                 fit: BoxFit.cover),
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(
//           "${document['name']}",
//         )
//       ],
//     );
//   }

//   Widget _postProfile(document) {
//     return Column(
//       children: [
//         Row(
//           children: [
//             Container(
//               height: 50,
//               width: 50,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 image: DecorationImage(
//                     image: NetworkImage("${document['profileurl']}"),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             SizedBox(width: 5),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("${document['username']}"),
//                 SizedBox(height: 3),
//                 Text(
//                   "${document['location']}",
//                   style: TextStyle(color: Colors.black45),
//                 ),
//               ],
//             ),
//             Spacer(),
//             IconButton(
//                 icon: Icon(Icons.more_vert),
//                 onPressed: () {
//                   PopupMenuButton(
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         PopupMenuItem(
//                           enabled: true,
//                           child: Text("delete"),
//                         ),
//                         PopupMenuItem(
//                           enabled: true,
//                           child: Text("View Profile"),
//                         ),
//                       ];
//                     },
//                   );
//                 })
//           ],
//         ),
//         SizedBox(height: 7),
//         GestureDetector(
//           onDoubleTap: () {
//             setState(() {
//               liked = !liked;
//             });
//           },
//           child: Container(
//             height: 250,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               // color: Colors.pink,
//               borderRadius: BorderRadius.circular(15),
//               image: DecorationImage(
//                   image: NetworkImage("${document['posturl']}"),
//                   fit: BoxFit.cover),
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: liked
//                         ? Icon(Icons.favorite_outline)
//                         : Icon(
//                             Icons.favorite,
//                             color: Colors.red,
//                           ),
//                     onPressed: () {
//                       setState(() {
//                         liked = !liked;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.chat_bubble_outline),
//                     onPressed: () {
//                       Navigator.pushNamed(context, RoutePages.commentPage);
//                     },
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.near_me_outlined),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.bookmark_outline),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         SizedBox(height: 10),
//       ],
//     );
//   }
// }
