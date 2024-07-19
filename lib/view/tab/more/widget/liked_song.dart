import 'package:flutter/material.dart';

class Song {
  final String title;
  final String artist;
  final String album;
  final String imagePath;

  Song({
    required this.title,
    required this.artist,
    required this.album,
    required this.imagePath,
  });
}

class LikedSongsPage extends StatelessWidget {
  final List<Song> likedSongs = [
    Song(
      title: 'Song 1',
      artist: 'Artist 1',
      album: 'Album 1',
      imagePath: 'https://example.com/song1.jpg',
    ),
    Song(
      title: 'Song 2',
      artist: 'Artist 2',
      album: 'Album 2',
      imagePath: 'https://example.com/song2.jpg',
    ),
    // Add more songs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        ),
        title: Text(
          'Liked Songs',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: likedSongs.length,
        itemBuilder: (context, index) {
          final song = likedSongs[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(song.imagePath),
            ),
            trailing: const Icon(
              Icons.favorite,
              color: Colors.green,
              size: 30,
            ),
            title: Text(song.title, style: TextStyle(color: Colors.white)),
            subtitle:
                Text(song.artist, style: TextStyle(color: Colors.grey[400])),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongDetailsPage(song: song),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class SongDetailsPage extends StatelessWidget {
  final Song song;

  SongDetailsPage({required this.song});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        title: Text(song.title, style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(song.imagePath),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                song.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                song.artist,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Album:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              song.album,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
