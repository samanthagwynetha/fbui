import 'package:arsua_labexam1/model/userdata.dart';
import 'package:arsua_labexam1/views/friendlist.dart';
import 'package:arsua_labexam1/views/infoheader.dart';
import 'package:arsua_labexam1/views/mainheader.dart';
import 'package:arsua_labexam1/views/postslist.dart';
import 'package:flutter/material.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  UserData userData = UserData();
  var followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          MainHeader(userData: userData),
          InfoHeader(userData: userData),
          FriendList(userData: userData),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Text('Posts', style: followTxtStyle),
              ],
            ),
          ),
          SizedBox(height: 20),
          PostList(userData: userData),
        ],
      ),
    );
  }
}