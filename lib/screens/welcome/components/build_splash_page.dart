import 'package:flutter/material.dart';

class BuildSplashPage extends StatelessWidget {
  String img;
  String description;
  Color kcolor;
  BuildSplashPage({
    super.key,
    required this.description,
    required this.img,
    required this.kcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcolor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 15, right: 15, top: 110, bottom: 70),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180),
              color: Colors.white,
              //TODO : add image in splash screen
              // image: DecorationImage(
              //   image: AssetImage(img),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
