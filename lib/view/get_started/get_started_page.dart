import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/constants/colors.dart';
import 'package:mb_spotify_pr/view/login/login_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorConstants.cardBackGroundColor,
        ),
        child: Stack(
          children: [
            Image.network(
                "https://i.pinimg.com/736x/6f/c7/f0/6fc7f083d9254aca54b379d004fb0b0e.jpg",
                fit: BoxFit.cover),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(100, 0, 0, 0),
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(240, 0, 0, 0),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ))),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 60,
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Millions of Songs",
                    style: TextStyle(
                        color: ColorConstants.foreground,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                Text("Free on Spotify",
                    style: TextStyle(
                        color: ColorConstants.foreground,
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 30,
                ),
                Column(children: [_buildButtonList(context)]),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }

  Widget _buildButtonList(BuildContext context) {
    return Container(
      width: 400,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        _buildButton(title: "Sign Up Free", isLightup: true, callback: () {}),
        _buildButton(
            title: "Continue with phone number",
            isLightup: false,
            icon: Icon(Icons.ad_units_sharp, color: Colors.white, size: 20),
            callback: () {}),
        _buildButton(
            title: "Continue with Google",
            isLightup: false,
            icon: Image.asset("assets/images/google.png", height: 10),
            callback: () {}),
        _buildButton(
            title: "Continue with phone number",
            isLightup: false,
            icon: Image.asset("assets/images/facebook.png", height: 10),
            callback: () {}),
        _buildButton(
            title: "Log in",
            isLightup: false,
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            }),
      ]),
    );
  }

  Widget _buildButton(
      {String title = "", Widget? icon, bool isLightup = false, callback}) {
    return InkWell(
      child: Container(
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 2),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            border: !isLightup
                ? Border.all(width: 2, color: ColorConstants.starterWhite)
                : null,
            borderRadius: BorderRadius.circular(60.0),
            color: isLightup
                ? ColorConstants.primaryColor
                : ColorConstants.cardBackGroundColor,
          ),
          child: Stack(
            children: [
              icon != null
                  ? Positioned(child: icon, left: 0, top: 0, bottom: 0)
                  : Container(),
              Center(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 12,
                          color: isLightup
                              ? Colors.black
                              : ColorConstants.starterWhite,
                          fontWeight: FontWeight.w600))),
            ],
          )),
      onTap: () {
        callback();
      },
    );
  }
}
