import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mb_spotify_pr/view/get_started/get_started_page.dart';
import 'package:mb_spotify_pr/player_module.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => PlayerModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: const GetStartedPage(),
    );
  }
}
