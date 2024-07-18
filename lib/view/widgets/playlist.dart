import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  const Playlist({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              child: Image.network(
            "https://upload.wikimedia.org/wikipedia/en/5/51/Igor_-_Tyler%2C_the_Creator.jpg",
            fit: BoxFit.cover,
            height: 130,
            width: 130,
          )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: Colors.white, fontSize: 12)),
            ],
          )
        ],
      ),
      width: 130,
    );
  }
}
