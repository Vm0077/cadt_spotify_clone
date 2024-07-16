import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/view/tab/home/home_page.dart';
import 'package:mb_spotify_pr/view/tab/more/more_page.dart';
import 'package:mb_spotify_pr/view/tab/search/search_page.dart';
import 'package:mb_spotify_pr/view/tab/widgets/slide_drawer.dart';
import 'package:mb_spotify_pr/constants/drawerlist.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _selectedIndex = 0;
  final List _screen = [
    const HomePage(),
    const SearchPage(),
    const MorePage(),
  ];
  final drawerKey = GlobalKey<SlidingDrawerState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SlidingDrawer(
        key: drawerKey,
        drawer: _buildDrawer(),
        child: _scaffoldPage(),
      ),
    );
  }

  Widget _buildDrawer() {
    return Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topLeft,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          // Profile
          Container(
            child: Row(children: [
              CircleAvatar(backgroundColor: Colors.red, child: Text("V")),
              SizedBox(width: 10),
              Column(children: [
                Text("Vm0077", style: TextStyle(fontSize: 20)),
                Text("view profile", style: TextStyle(fontSize: 16)),
              ]),
            ]),
          ),
          // Setting List
          Expanded(
            child: ListView.builder(
              itemCount: drawer_list.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(children: [
                        Icon(
                          drawer_list[index]["icon"],
                          size: 30,
                        ),
                        Text(drawer_list[index]["title"])
                      ]),
                    ),
                    onTap: () {
                      print(drawer_list[index]["title"]);
                    });
              },
            ),
          ),
        ]));
  }

  Widget _scaffoldPage() {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: ColorConstants.primaryColor,
        unselectedItemColor: Colors.white,
        enableFeedback: true,
        currentIndex: _selectedIndex,
        onTap: ((value) {
          setState(() {
            _selectedIndex = value;
          });
        }),
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              activeIcon: Icon(Icons.more_horiz),
              label: 'Library')
        ],
      ),
    );
  }
}
