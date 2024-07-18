import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/artist.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/top_music.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/weekly_music_list.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/weekly_title.dart';
import 'package:mb_spotify_pr/view/tab/home/widgets/best_of_artist.dart';
import 'package:mb_spotify_pr/view/tab/widgets/custom_title.dart';
import 'package:mb_spotify_pr/view/tab/widgets/welcome_title.dart';
import 'package:mb_spotify_pr/view/widgets/poster_card.dart';
import 'package:sticky_headers/sticky_headers.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    Key? drawerKey,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _tab = [
    AllTab(key: GlobalKey()),
    MusicTab(key: GlobalKey()),
    PodcastTab(key: GlobalKey()),
  ];
  ScrollController _scrollController = ScrollController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          key: ObjectKey(_tab[_index]),
          child: Column(children: [
            StickyHeader(
                header:
                    WelcomeTitle(changeTap: _changeTab, currentIndex: _index),
                content: _tab[_index]),
          ]),
        ));
  }

  void _changeTab(int index) {
    setState(() {
      _index = index;
    });
  }
}

class AllTab extends StatelessWidget {
  const AllTab({super.key});
  @override
  Widget build(BuildContext context) {
    List<Widget> item = [
      WeeklyTitle(),
      WeeklyMusicList(),
      TopMusic(),
      Artist(),
      BestOfArtist(),
      ..._records(),
    ];
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      alignment: Alignment.center,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: item[index],
            );
          }),
    );
  }

  List<Widget> _records() {
    List<Widget> tmp = [];
    for (int i = 0; i < 5; i++) {
      tmp.add(new RecordCard());
    }
    return tmp;
  }
}

class MusicTab extends StatelessWidget {
  const MusicTab({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
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
          CustomTitle(title: 'Your Top Mixes1'),
          SizedBox(
            height: 12,
          ),
          TopMusic(),
          SizedBox(),
          CustomTitle(title: 'Suggested artists'),
          SizedBox(
            height: 24,
          ),
          Artist(),
        ],
      ),
    );
  }
}

class PodcastTab extends StatelessWidget {
  const PodcastTab({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          SizedBox(
            height: 30,
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
          CustomTitle(title: 'Your Top Mixes2'),
          SizedBox(
            height: 12,
          ),
          TopMusic(),
          SizedBox(),
          CustomTitle(title: 'Suggested artists'),
          SizedBox(
            height: 24,
          ),
          Artist()
        ],
      ),
    );
  }
}
