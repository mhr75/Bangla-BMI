import 'package:flutter/material.dart';

class cardReusable extends StatelessWidget {
  final IconData icon;
  final String label;
  cardReusable({this.icon,this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon,
            size: 70),
        SizedBox(height: 15),
        Text(label,style: TextStyle(
          fontSize: 18,
          color: Color(0xFFFFFFFF),
        )),
      ],
    );
  }
}