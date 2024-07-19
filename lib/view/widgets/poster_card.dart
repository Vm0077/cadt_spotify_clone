import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/data/classes.dart';

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
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0);
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

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
          PageView.builder(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            controller: _pageViewController,
            onPageChanged: _handlePageViewChanged,
            itemBuilder: (context, index) {
              return ZoomImage(cover: widget.playList.songs![index].url);
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
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                      color: Colors.blue,
                      icon: Icon(Icons.arrow_right),
                      iconSize: 50,
                      onPressed: () {
                        print(_currentPageIndex);
                        _updateCurrentPageIndex((_currentPageIndex + 1) % 3);
                      }),
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
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    if (index == 0) {
      _pageViewController.jumpTo(
        0,
      );
      return;
    }
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
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
        IconButton(
          iconSize: 25,
          icon: Icon(Icons.add_circle_outline_rounded),
          color: Colors.white,
          onPressed: () {
            //click
          },
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

class ZoomImage extends StatefulWidget {
  const ZoomImage({super.key, required this.cover});
  final String cover;

  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage>
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
        setState(() {
// The state that has changed here is the animation object's value.
        });
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

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
