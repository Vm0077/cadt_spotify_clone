import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/data/data.dart';
import 'package:mb_spotify_pr/view/tab/search/widget/browse_card.dart';
import 'package:mb_spotify_pr/view/tab/search/widget/podcast.dart';
import 'package:mb_spotify_pr/view/tab/search/widget/search_input.dart';
import 'package:mb_spotify_pr/view/tab/widgets/custom_title.dart';
import 'package:mb_spotify_pr/view/tab/widgets/welcome_title.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 54,
              ),
              const SizedBox(
                height: 32,
              ),
              const SearchInput(),
              const SizedBox(
                height: 13,
              ),
              Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: searchList
                      .map(
                        (search) => Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                color: ColorConstants.cardBackGroundColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              search,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400),
                            )),
                      )
                      .toList()),
              const SizedBox(
                height: 24,
              ),
              const CustomTitle(title: 'Podcast’s'),
              const SizedBox(
                height: 13,
              ),
              const PodCast(),
              const SizedBox(
                height: 12,
              ),
              const CustomTitle(title: 'Browse all'),
              const SizedBox(
                height: 13,
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  BrowseCard(
                      title: 'Made For You',
                      color1: '#E02FCF',
                      color2: '#00C188'),
                  BrowseCard(
                      title: 'Charts', color1: '#0A3CEC', color2: '#4DD4AC'),
                  BrowseCard(
                      title: 'Discover', color1: '#0A3CEC', color2: '#D9DD01'),
                  BrowseCard(
                      title: 'New Release',
                      color1: '#0E31AE',
                      color2: '#DD1010'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
