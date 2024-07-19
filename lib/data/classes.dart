class Song {
  final String title;
  final String type;
  final String artist;
  final String cover;
  const Song({
    required this.title,
    required this.type,
    required this.artist,
    required this.cover,
  });
}

class Albumn {
  final List<Song>? songs;
  final String title;
  final String type;
  final String artist;
  final String description;
  final String cover;
  const Albumn({
    required this.title,
    required this.type,
    required this.artist,
    required this.cover,
    required this.description,
    this.songs,
  });
}

class PlayList extends Albumn {
  const PlayList({
    required title,
    required type,
    artist,
    required cover,
    required description,
    songs,
  }) : super(
            title: title,
            type: type,
            artist: "",
            cover: cover,
            description: description,
            songs: songs);
}
