import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/view/tab/more/widget/activity_card.dart';
import 'package:mb_spotify_pr/view/tab/more/widget/developer.dart';
import 'package:mb_spotify_pr/view/tab/more/widget/more_title.dart';
import 'package:mb_spotify_pr/view/tab/more/widget/play_list_card.dart';
import 'package:mb_spotify_pr/view/tab/widgets/custom_title.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 54,),
            const MoreTitle(title: 'Your Library'),
            const PlayListCard(),
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {},
                child: const Text('See all', style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ))
              ),
            ),
            const SizedBox(height: 8),
            const CustomTitle(title: 'Your Activities'),
            const SizedBox(height: 16,),
            Divider(
              color: Colors.grey.shade800,
            ),
            InkWell(
      onTap: () {
        Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DeveloperMembersPage(),
                        ));
      },
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 8),
        leading: Icon(Icons.person, color: Colors.white, size: 32),
        trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white, size: 46,),
        title: Text('Developer Team', style: const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontWeight: FontWeight.w600
        )),
      ),
    ),
    Divider(
              color: Colors.grey.shade800,
            ),
            const ActivityCard(
              title: 'Liked Songs',
              icon: Icons.favorite
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            const ActivityCard(
              title: 'Followed Artist',
              icon: Icons.people
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            const ActivityCard(
              title: 'Followed Podcast',
              icon: Icons.mic
            ),
            Divider(
              color: Colors.grey.shade800,
            ),
            
          ],
        ),
      ),
    );
  }
}
