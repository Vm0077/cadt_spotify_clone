import "package:flutter/material.dart";

class SlidingDrawer extends StatefulWidget {
  final Widget drawer;
  final Widget child;
  final int swipeSensitivity;
  final double drawerRatio;
  final Color overlayColor;
  final double overlayOpacity;
  final int animationDuration;
  final Curve animationCurve;

  const SlidingDrawer({
    required key,
    required this.drawer,
    required this.child,
    this.swipeSensitivity = 25,
    this.drawerRatio = 0.8,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.5,
    this.animationDuration = 500,
    this.animationCurve = Curves.ease,
  }) : super(key: key);
  @override
  SlidingDrawerState createState() => SlidingDrawerState();
}

class SlidingDrawerState extends State<SlidingDrawer> {
  bool _opened = false;

  void open() {
    setState(() {
      _opened = true;
    });
  }

  void close() {
    setState(() {
      _opened = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final drawerWidth = width * widget.drawerRatio;

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > widget.swipeSensitivity) {
          open();
        } else if (details.delta.dx < -widget.swipeSensitivity) {
          close();
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            AnimatedPositioned(
              width: drawerWidth,
              height: height,
              left: _opened ? 0 : -drawerWidth,
              duration: Duration(milliseconds: widget.animationDuration),
              curve: widget.animationCurve,
              child: Container(
                color: Colors.amber,
                child: widget.drawer,
              ),
            ),
            AnimatedPositioned(
              height: height,
              width: width,
              left: _opened ? drawerWidth : 0,
              duration: Duration(milliseconds: widget.animationDuration),
              curve: widget.animationCurve,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  widget.child,
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: widget.animationDuration),
                    switchInCurve: widget.animationCurve,
                    switchOutCurve: widget.animationCurve,
                    child: _opened
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                _opened = false;
                              });
                            },
                            child: Container(
                              color: widget.overlayColor.withOpacity(
                                widget.overlayOpacity,
                              ),
                            ),
                          )
                        : null,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerNotification extends Notification {
  final bool? drawerOpened = false;
  const DrawerNotification();
}
