import 'package:flutter/material.dart';

class RecordCard extends StatelessWidget {
  const RecordCard({
    Key? key,
  }) : super(key: key);

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
        color: Color.fromARGB(255, 50, 50, 100),
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
          Text("Frieren: Beyond the journey's end",
              style: _textTitle, textAlign: TextAlign.start),
          Text("Anime", style: _subTitle, textAlign: TextAlign.start),
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
              "https://m.media-amazon.com/images/S/pv-target-images/b054f79f938837f13e1be59cb3d0cf4afcc4f4923ceae6fc192837b03fa726eb.jpg",
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
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
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

class RecordsCard extends StatelessWidget {
  const RecordsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  return Text("Hello");
                })));
  }
}
