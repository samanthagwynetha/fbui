import 'package:arsua_labexam1/model/userdata.dart';
import 'package:arsua_labexam1/model/userpost.dart';
import 'package:arsua_labexam1/profileview.dart';
import 'package:flutter/material.dart';

class PostList extends StatefulWidget {
  const PostList({super.key, required this.userData});

  final UserData userData;

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  var nametxtStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );

  gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
      ),);
  }
  Widget buttons(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPost.isLiked) ? Colors.blue : Colors.grey,
        ),
        onPressed: (){
          setState(() {
            userPost.isLiked = (userPost.isLiked) ? false : true;
          });
        },
        icon: Icon(Icons.thumb_up),
        label: Text('Like'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: (){}, 
        icon: Icon(Icons.message),
        label: Text('Comment'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: Colors.grey,
        ),
        onPressed: (){}, 
        icon: Icon(Icons.share),
        label: Text('Share'),
      ),
    ],
  );
  Widget postCount(UserPost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        '${userPost.numcomments}',
      ),
      Text(' . '),
      Text(
        '${userPost.numshare}',
      ),
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      height: 350,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(userPost.postimg),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );

    Widget postHeader(UserPost userPost) => Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              userPost.userimg,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userPost.username,
              style: nametxtStyle,
            ),
            Row(
              children: [
                Text('${userPost.time} . '),
                const Icon(
                  Icons.people,
                  size: 18,
                ),
              ],
            )
          ],
        )
      ],
  );

  Widget showPost(UserPost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        margin: EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              userPost.postcontent,
              style: nametxtStyle,
            ),
          ],
        ),
      ),
      postImage(userPost),
      postCount(userPost),
      Divider(),
      buttons(userPost),
      SizedBox(
        height: 10,
        child: Container(
          color: Colors.grey,
        ),
      ),
      SizedBox(
        height: 15,
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView(
        shrinkWrap: true,
        children: widget.userData.userList.map((userPost){
          return InkWell(
            onTap: (){
              gotoPage(context, ProfileView(userPost: userPost));
            },
            child: showPost(userPost),
          );
        }).toList(),
      ),
    );
  }
}