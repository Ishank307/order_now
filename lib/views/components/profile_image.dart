import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double height;
  final double width;
  const ProfileImage({super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        height: height,
        width: width,
        child: Image.asset("assets/images/user.png"),
      ),
    );
  }
}
