import 'package:arsua_labexam1/model/userdata.dart';
import 'package:flutter/material.dart';

import 'model/comment.dart';
import 'model/userpost.dart';

class ProfileView extends StatelessWidget {
    ProfileView({
    super.key,
    required this.userPost,
    });
    
    final UserPost userPost;
    final UserData userData = UserData();

    var nametxtStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    var boldtxtStyle = TextStyle(
      fontWeight: FontWeight.bold,
    );
    var boldtxtStyle1 = const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget commentBtn(UserComment userComment) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(userComment.commentTime),
          SizedBox(width: 15),
          Text('Like'),
          SizedBox(width: 15),
          Text('Reply')    
        ],
      ),
    );
    Widget commentDesc(UserComment userComment) => Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userComment.commenterName, style: boldtxtStyle),
          SizedBox(height: 5),
          Row(
            children: [
              Text(userComment.commentContent)
            ],
          )
        ],
      ),
    );
    Widget commentSpace(UserComment userComment) => Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(35, 158, 158, 158),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        )
      ),
      child: commentDesc(userComment),
    );

  Widget commenterPic(UserComment userComment) =>  Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userComment.commenterImg), 
      ),
  );
  Widget usercommenterline(UserPost userPost, UserComment userComment) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      commenterPic(userComment),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commentSpace(userComment),
          commentBtn(userComment),
        ],
      ),
    ],
  );
  Widget userpostdetails(UserComment userComment) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: 15),
      usercommenterline(userPost, userComment),
    ],
  );
  Widget commenters(UserPost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Divider(color: Color.fromARGB(86, 158, 158, 158)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(userPost.numshare, style: boldtxtStyle),
          ],
        ), 
      ),
      SizedBox(height: 15),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text('All comments', style: boldtxtStyle1),
            Icon(Icons.arrow_drop_down),
          ],
        ), 
      ),
      SizedBox(height: 15),
    ],
  );

  Widget buttons(UserPost userPost) => Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Divider(color: Color.fromARGB(86, 158, 158, 158)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor:
                    (!userPost.isLiked) ? Colors.grey : Colors.blue),
            onPressed: () {},
            icon: Icon(Icons.thumb_up, size: 20),
            label: const Text('Like'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: (){},
              icon: Icon(Icons.chat_bubble, size: 20),
              label: Text('Comment'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Colors.grey),
              onPressed: (){},
              icon: Icon(Icons.share),
              label: Text('Share'),
            )
          ],
        ),
      ),
      Divider(color: Color.fromARGB(86, 158, 158, 158)),
    ],
  );

  Widget userline(UserPost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text(userPost.time),
              Text(' . '),
              Icon(Icons.group, size: 16, color: Colors.grey,),
            ],
          ),
        ],
      ),
    ],
  );

  Widget postImage(UserPost userPost) => Padding(
    padding: EdgeInsets.all(10.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(userPost.postcontent),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 350,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(userPost.postimg),
              fit: BoxFit.fill,
            ),
          ),
        )
      ],
    ),
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: Icon(
            Icons.arrow_back,
            color: Colors.grey,
          )),
      ),

      body: ListView(
        children: [
          userline(userPost),
          postImage(userPost),
          buttons(userPost),
          commenters(userPost),
          ListView(
            shrinkWrap: true,
            children: userData.commentList.map((UserComment){
              return userpostdetails(UserComment);
            }).toList(),
          )
        ],
      ),
    );
  }
}