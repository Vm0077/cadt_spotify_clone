import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mb_spotify_pr/player_module.dart';

class Player extends StatefulWidget {
  const Player({Key? key, this.color}) : super(key: key);
  final Color? color;
  @override
  State<StatefulWidget> createState() => _Player();
}

class _Player extends State<Player> {
  @override
  Widget build(BuildContext context) {
    Color? color;
    return Consumer<PlayerModel>(builder: (context, value, child) {
      return Container(
          key: ObjectKey(value.song),
          height: 45,
          width: MediaQuery.of(context).size.width - 10,
          decoration: BoxDecoration(
              color: color == null ? Colors.grey[900] : color,
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.all(5.0),
          child: Row(children: [
            if (value.song.local == true)
              Image.asset(value.song.cover)
            else
              Image.network(value.song.cover),
            SizedBox(width: 8),
            Flexible(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.song.title,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            overflow: TextOverflow.ellipsis)),
                    Text(value.song.artist,
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey[50],
                            overflow: TextOverflow.ellipsis))
                  ]),
            ),
            IconButton(icon: Icon(Icons.speaker), onPressed: () {}),
            IconButton(icon: Icon(Icons.add_rounded), onPressed: () {}),
            IconButton(icon: Icon(Icons.play_arrow), onPressed: () {}),
          ]));
    });
  }
}
