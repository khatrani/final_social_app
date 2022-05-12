import 'package:final_social_app/utils/routes.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  Comments({Key key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  var liked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.homepage);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu),
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
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.grey[300],
          ),
          SizedBox(
            height: 5,
          ),
          postpic(),
        ],
      ),
    );
  }

  Widget postpic() {
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
                    image: NetworkImage(
                        "https://png.pngtree.com/background/20210714/original/pngtree-beautiful-sunrise-on-a-frozen-river-in-winter-picture-image_1198461.jpg"),
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
                  "Khatrani Reshma",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Surat"),
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
                  image: NetworkImage(
                      "https://png.pngtree.com/background/20210714/original/pngtree-beautiful-sunrise-on-a-frozen-river-in-winter-picture-image_1198461.jpg"),
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
                    onPressed: () {},
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
        comment(),
        commentsdetails(),
      ],
    );
  }

  Widget comment() {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 50,
          ),
          Icon(Icons.expand_less),
          SizedBox(
            width: 10,
          ),
          Text(
            "Previous",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 100,
          ),
          Icon(Icons.keyboard_arrow_up),
          SizedBox(
            width: 10,
          ),
          Text(
            "oldesd",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget commentsdetails() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(12),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://www.stockvault.net/data/2011/02/21/117750/thumb16.jpg'),
                  fit: BoxFit.cover,
                ),
                color: Colors.cyanAccent,
                shape: BoxShape.circle,
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'James Bond',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2 Hour',
                    style: TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      'Life is like a box of chocolates; sometimes you just dig out the good center parts and leave all the undesirable rest to waste.',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        Container(
          padding: EdgeInsets.only(right: 100),
          // margin: EdgeInsets.only(right: 100),
          child: TextFormField(
            onChanged: (v) {},
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: "Comments",
            ),
          ),
        ),
      ],
    );
  }
}
