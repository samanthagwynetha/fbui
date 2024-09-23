import 'package:arsua_labexam1/model/friend.dart';
import 'package:arsua_labexam1/model/userdata.dart';
import 'package:flutter/material.dart';

class FriendList extends StatelessWidget {
    FriendList({super.key, required this.userData});

    final UserData userData;

    var followTxtStyle = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    );
    Widget friend(Friend friend) => Card(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              friend.img,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(friend.name),
          ),
        ],
      ),
    );

    Widget friendListGrid() => GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisExtent: 180,
      ),
      itemCount: userData.friendList.length,
      itemBuilder: (BuildContext ctx, index){
        return friend(userData.friendList[index]);
      },
    );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                'Friends',
                style: followTxtStyle,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text('${userData.myUserAccount.numFriends} Friend'),
            ],
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 380,
          child: friendListGrid(),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}