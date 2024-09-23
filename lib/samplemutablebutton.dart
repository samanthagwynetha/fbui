import 'package:flutter/material.dart';

class SampleMutableButton extends StatefulWidget {
  SampleMutableButton({super.key});

  @override
  State<SampleMutableButton> createState() => _SampleMutableButtonState();
}

class _SampleMutableButtonState extends State<SampleMutableButton> {
  bool isClicked = false;

  clickButton(){
    setState((){
      isClicked = (isClicked) ? false: true;
    });
  }

  textAndIconColor() => (isClicked) ? Colors.white : Colors.grey;

  btnColor() => (isClicked) ? Colors.blue : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: btnColor(),
              ),
              onPressed: (){
                clickButton();
              },
              icon: Icon(
                Icons.thumb_up,
                color: textAndIconColor(),
                ),
                label: Text(
                  'LIKE',
                  style: TextStyle(
                    color: textAndIconColor()
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}