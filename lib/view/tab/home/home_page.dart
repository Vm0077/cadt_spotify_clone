import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/artist.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/top_music.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/weekly_music_list.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/weekly_title.dart';
import 'package:mb_spotify_pr/view/tab/widgets/custom_title.dart';
import 'package:mb_spotify_pr/view/tab/widgets/welcome_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    Key? drawerKey,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 30,
            ),
            WelcomeTitle(
              title: 'Good Morning',
            ),
            SizedBox(
              height: 32,
            ),
            WeeklyTitle(),
            SizedBox(
              height: 24,
            ),
            WeeklyMusicList(),
            SizedBox(
              height: 16,
            ),
            CustomTitle(title: 'Your Top Mixes'),
            SizedBox(
              height: 12,
            ),
            TopMusic(),
            SizedBox(
              height: 12,
            ),
            CustomTitle(title: 'Suggested artists'),
            SizedBox(
              height: 24,
            ),
            Artist()
          ],
        ),
      ),
    );
  }
}
