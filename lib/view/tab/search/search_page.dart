import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/data/data.dart';
import 'package:mb_spotify_pr/view/tab/search/widget/browse_card.dart';
import 'package:mb_spotify_pr/view/tab/search/widget/podcast.dart';
import 'package:mb_spotify_pr/view/tab/widgets/custom_title.dart';
import 'package:mb_spotify_pr/view/tab/widgets/welcome_title.dart';
import 'package:mb_spotify_pr/view/top_hits/top_hits.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = '';
  bool search = false;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredData = topMixes.where((mix) {
      return mix['title'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 54,
              ),
              Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Search',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal)),
        search == false
        ? IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        )
        : IconButton(
          icon: Icon(
            Icons.backspace_outlined,
            color: Colors.white,
          ),
          onPressed: () {
              setState(() {
                    search = false;
                  });
          },
        )
      ],
    ),
              const SizedBox(
                height: 32,
              ),
              TextField(
                onTap: () {
                  setState(() {
                    search = true;
                  });
                },
                // onTapOutside: (event) {
                //   setState(() {
                //     search = false;
                //   });
                // },
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
                style: const TextStyle(color: Colors.white, fontSize: 11),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorConstants.cardBackGroundColor,
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: ColorConstants.inputHintColor, fontSize: 11),
                  prefixIcon: Icon(Icons.search,
                      color: !FocusScope.of(context).isFirstFocus
                          ? Colors.white
                          : ColorConstants.primaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: ColorConstants.primaryColor)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              search == false
              ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Wrap(
                  spacing: 19,
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
                          title: 'Charts',
                          color1: '#0A3CEC',
                          color2: '#4DD4AC'),
                      BrowseCard(
                          title: 'Discover',
                          color1: '#0A3CEC',
                          color2: '#D9DD01'),
                      BrowseCard(
                          title: 'New Release',
                          color1: '#0E31AE',
                          color2: '#DD1010'),
                    ],
                  ),
                ],
              )
              : filteredData.isEmpty
                  ? Text('No results found')
                  : Column(
                      children: filteredData.map((mix) {
                        return InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TopHits())),
                          child: ListTile(
                            title: Text(mix['title']),
                            subtitle: Text(mix['description'] ?? ''),
                            leading: Image.asset(mix['image']),
                          ),
                        );
                      }).toList(),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
