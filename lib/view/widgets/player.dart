import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Player();
}

class _Player extends State<Player> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        child: Row(children: [
          Image.network(
            "https://img.buzzfeed.com/buzzfeed-static/complex/images/nji2i9pyf3ocnbccuvgc/tyler-the-creator-call-me-if-you-get-lost-album-cover-interview-lead-image.jpg?output-format=jpg&output-quality=auto",
          ),
          SizedBox(width: 8),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Title",
                  style: TextStyle(fontSize: 12, color: Colors.white)),
              Text("Artist",
                  style: TextStyle(fontSize: 11, color: Colors.grey[50]))
            ]),
          ),
          IconButton(icon: Icon(Icons.speaker), onPressed: () {}),
          IconButton(icon: Icon(Icons.add_rounded), onPressed: () {}),
          IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
        ]));
  }
}
