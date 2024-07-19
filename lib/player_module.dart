import "package:flutter/material.dart";
import "package:mb_spotify_pr/data/classes.dart";
import "package:mb_spotify_pr/data/data.dart";

class PlayerModel extends ChangeNotifier {
  Song _song = pl1.songs![0];
  Song get song => _song;
  void changeSong(Song new_song) {
    _song = new_song;
    notifyListeners();
  }
}
