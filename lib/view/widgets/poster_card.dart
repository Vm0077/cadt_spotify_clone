import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/data/classes.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:mb_spotify_pr/constants/colors.dart';

class RecordCard extends StatelessWidget {
  const RecordCard(
      {Key? key,
      required this.title,
      required this.type,
      required this.description,
      required this.url,
      required this.color})
      : super(key: key);

  final String title;
  final String type;
  final String url;
  final String description;
  final Color color;

  static final TextStyle _textTitle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );
  static final TextStyle _subTitle = TextStyle(
    fontSize: 14,
    color: Colors.grey[500],
    overflow: TextOverflow.ellipsis,
  );
  static final TextStyle _desStyle = TextStyle(
    fontSize: 11,
    color: Colors.grey[500],
  );

  @override
  Widget build(BuildContext context) {
    final Widget _build = Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: color,
      ),
      height: 300,
      child: Column(children: [
        _buildCardheader(),
        Expanded(
          flex: 1,
          child: _buildDescription(),
        ),
        _buildCardControl(),
      ]),
    );
    return Card(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: _build,
      ),
    );
  }

  Widget _buildCardheader() {
    return Row(children: [
      Expanded(
        flex: 1,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: _textTitle, textAlign: TextAlign.start),
          Text(type, style: _subTitle, textAlign: TextAlign.start),
        ]),
      ),
      IconButton(
        iconSize: 25,
        icon: Icon(Icons.add_circle_outline_rounded),
        color: Colors.white,
        onPressed: () {
          //click
        },
      ),
    ]);
  }

  Widget _buildDescription() {
    return Container(
        height: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: null,
        ),
        child: Column(children: [
          Stack(children: [
            Image.network(
              url,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ]),
          Expanded(
              child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: FractionalTranslation(
                      translation: Offset(0, 0.18),
                      child: SingleChildScrollView(
                        child: Text(
                          description,
                          softWrap: true,
                          style: _desStyle,
                        ),
                      ))))
        ]));
  }

  Widget _buildCardControl() {
    final Widget _control = Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          width: 10,
          child: ElevatedButton.icon(
              icon: Icon(
                Icons.volume_up,
                color: Colors.grey[100],
                size: 15.0,
              ),
              label: Text('preview episode', style: TextStyle(fontSize: 12)),
              onPressed: () {
                print('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 30),
                foregroundColor: Colors.white,
              )),
        ),
      ),
      Row(children: [
        IconButton(
          iconSize: 25,
          icon: Icon(Icons.more_vert),
          color: Colors.white,
          onPressed: () {
            //click
          },
        ),
        IconButton(
          iconSize: 25,
          icon: Icon(Icons.play_circle_sharp),
          color: Colors.white,
          onPressed: () {
            //click
          },
        ),
      ]),
    ]);

    return Column(
      children: [
        _control,
      ],
    );
  }
}

class FillRecordCard extends StatefulWidget {
  const FillRecordCard({Key? key, required this.playList, required this.color})
      : super(key: key);

  final Color color;
  final PlayList playList;
  static final TextStyle _textTitle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
  );
  static final TextStyle _subTitle = TextStyle(
    fontSize: 14,
    color: Colors.grey[500],
    overflow: TextOverflow.ellipsis,
  );
  static final TextStyle _desStyle = TextStyle(
    fontSize: 11,
    color: Colors.grey[500],
  );

  @override
  State<FillRecordCard> createState() => _FillRecordCardState();
}

class _FillRecordCardState extends State<FillRecordCard>
    with TickerProviderStateMixin {
  SwiperController _swiperController = SwiperController();
  int _currentPageIndex = 1;
  bool _hasbeenCheck = false;
  bool _animating = true;

  @override
  Widget build(BuildContext context) {
    final Widget _build = Container(
      decoration: BoxDecoration(
        color: widget.color,
      ),
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: Stack(
        children: [
          // background
          Swiper(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            loop: true,
            onIndexChanged: _handlePageViewChanged,
            itemCount: widget.playList.songs!.length,
            controller: _swiperController,
            itemBuilder: (context, index) {
              return ZoomImage(
                  cover: widget.playList.songs![index].url,
                  animating: _animating);
            },
          ),
          // content
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(200, 0, 0, 0),
                Color.fromARGB(100, 0, 0, 0),
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(100, 0, 0, 0),
                Color.fromARGB(200, 0, 0, 0),
              ],
            )),
            padding: EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Column(children: [
                  _buildCardheader(),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  _buildCardControl(),
                ]),

                // forward arrow
                Positioned(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        color: ColorConstants.cardBackGroundColor,
                        icon:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Color.fromARGB(100, 0, 0, 0),
                          padding: EdgeInsets.all(0),
                        ),
                        iconSize: 15,
                        onPressed: () {
                          _swiperController.next();
                        }),
                  ),
                ),
                // backward arrow
                Positioned(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        color: ColorConstants.cardBackGroundColor,
                        icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                        style: IconButton.styleFrom(
                          backgroundColor: Color.fromARGB(100, 0, 0, 0),
                          padding: EdgeInsets.all(0),
                        ),
                        iconSize: 15,
                        onPressed: () {
                          _swiperController.previous();
                        }),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return Card(
      margin: EdgeInsets.all(20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: _build,
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    setState(() {
      _currentPageIndex = currentPageIndex;
      _hasbeenCheck = true;
    });
  }

  void _disableAnimation() {
    setState(() {
      _hasbeenCheck = false;
      _animating = false;
    });
  }

  void _enableAnimation() {
    setState(() {
      _animating = true;
    });
  }

  Widget _buildCardheader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.network(widget.playList.cover,
                height: 50, width: 50, fit: BoxFit.cover),
            const SizedBox(width: 5),
            SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: Text(widget.playList.title,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: FillRecordCard._textTitle,
                          textAlign: TextAlign.start),
                    ),
                    Container(
                      width: 100,
                      child: Text(widget.playList.type,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: FillRecordCard._subTitle,
                          textAlign: TextAlign.start),
                    ),
                  ]),
            ),
          ],
        ),
        VisibilityDetector(
          key: Key("playlist-${ObjectKey(widget.playList.title)}"),
          onVisibilityChanged: (VisibilityInfo info) {
            if (info.visibleBounds.bottom == 0) {
              _disableAnimation();
              return;
            }
            _enableAnimation();
          },
          child: IconButton(
            iconSize: 25,
            icon: Icon(Icons.add_circle_outline_rounded),
            color: Colors.white,
            onPressed: () {
              //click
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Container();
  }

  Widget _buildCardControl() {
    final Widget _control = Row(children: [
      Expanded(
        flex: 1,
        child: Container(
          width: 10,
          child: ElevatedButton.icon(
              key: ObjectKey(widget.playList.songs![_currentPageIndex]),
              icon: Icon(
                Icons.volume_up,
                color: Colors.grey[100],
                size: 15.0,
              ),
              label: !_hasbeenCheck
                  ? Text("preview playlist", style: TextStyle(fontSize: 11))
                  : TextScroll(widget.playList.songs![_currentPageIndex].title +
                      ' - ' +
                      widget.playList.songs![_currentPageIndex].artist +
                      '       '),
              onPressed: () {
                print('Button Pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 30, 30, 30),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 10),
              )),
        ),
      ),
      Row(children: [
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.more_vert),
          color: Colors.white,
          onPressed: () {
            //click
          },
        ),
        IconButton(
          iconSize: 20,
          icon: Icon(Icons.play_circle_sharp),
          color: Colors.white,
          onPressed: () {
            //click
          },
        ),
      ]),
    ]);

    return Column(
      children: [
        _control,
      ],
    );
  }
}

class ZoomImage extends StatefulWidget {
  const ZoomImage({super.key, required this.cover, required this.animating});
  final String cover;
  final bool animating;

  @override
  State<ZoomImage> createState() => ZoomImageState();
}

class ZoomImageState extends State<ZoomImage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 12), vsync: this);
    animation = Tween<double>(begin: 1, end: 1.3).animate(controller)
      ..addListener(() {
        if (!widget.animating) {
          stop_animation();
        }
        setState(() {});
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: double.maxFinite,
      child: ClipRect(
        child: ScaleTransition(
          scale: animation,
          child: Image.network(
            widget.cover,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }

  void stop_animation() {
    controller.stop();
  }

  void reset_animation() {
    controller.reset();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
