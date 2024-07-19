import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/data/data.dart';

class Artist extends StatelessWidget {
  const Artist({
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
              width: 155,
              padding: const EdgeInsets.only(
                  right: 15, left: 15, top: 15, bottom: 0),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(125),
                    child: SizedBox(
                        height: 125,
                        width: 125,
                        child: Image.network(artist['image'])),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(artist['name'],
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                ],
              ),
            );
          }),
    );
  }
}
