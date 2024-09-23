import 'package:arsua_labexam1/model/userdata.dart';
import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget {
  MainHeader({
    super.key,
    required this.userData,
    
  });

  final UserData userData;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(
            userData.myUserAccount.img,
          ),
          radius: 40,
        ),
        Text(
          userData.myUserAccount.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Text(
          userData.myUserAccount.email,
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}