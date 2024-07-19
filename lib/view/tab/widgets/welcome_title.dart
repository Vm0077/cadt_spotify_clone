import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/view/tab/widgets/slide_drawer.dart';
import 'package:mb_spotify_pr/constants/colors.dart';

class TabTitle extends StatefulWidget {
  const TabTitle({
    super.key,
    Key? drawerKey,
    required this.changeTap,
    required this.currentIndex,
  });

  final int currentIndex;
  final ValueChanged<int> changeTap;

  @override
  State<TabTitle> createState() => _TabTitleState();
}

class _TabTitleState extends State<TabTitle> {
  final List tabList = [
    "All",
    "Music",
    "Podcast",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 5),
      decoration: BoxDecoration(color: ColorConstants.cardBackGroundColor),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
              child: CircleAvatar(
                backgroundColor: Colors.red,
                child: Text("V"),
                maxRadius: 15,
                minRadius: 10,
              ),
              onTap: () {
                DrawerInheritedData.of(context)?.open();
              }),
          SizedBox(width: 10.0),
          SizedBox(
            height: 30,
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: tabList.length,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                    child: Text(tabList[index]),
                    onPressed: () {
                      widget.changeTap(index);
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(2.0),
                      backgroundColor: widget.currentIndex == index
                          ? ColorConstants.primaryColor
                          : ColorConstants.cardBackGroundColor,
                      foregroundColor: widget.currentIndex == index
                          ? ColorConstants.cardBackGroundColor
                          : ColorConstants.starterWhite,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal)),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
