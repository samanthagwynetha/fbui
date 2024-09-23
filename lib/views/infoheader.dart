import 'package:arsua_labexam1/model/userdata.dart';
import 'package:flutter/material.dart';

class InfoHeader extends StatelessWidget {
    InfoHeader({
    super.key,
    required this.userData,  
  });

  final UserData userData;
  var followTxtStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userData.myUserAccount.numFollowers,
              style: followTxtStyle,
            ),
            Text(
              userData.myUserAccount.numPosts,
              style: followTxtStyle,
            ),
            Text(
              userData.myUserAccount.numFollowing,
              style: followTxtStyle,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}