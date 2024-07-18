import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/data/data.dart';
import 'package:mb_spotify_pr/view/widgets/playlist.dart';

class BestOfArtist extends StatelessWidget {
  const BestOfArtist({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: artists.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            final artist = artists[index];

            return Container(
                child: Playlist(title: artist['name']),
                margin: EdgeInsets.symmetric(horizontal: 10.0));
          }),
    );
  }
}
