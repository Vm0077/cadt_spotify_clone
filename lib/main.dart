import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/state_management/library_list.dart';
import 'package:provider/provider.dart';
import 'package:mb_spotify_pr/view/get_started/get_started_page.dart';
import 'package:mb_spotify_pr/player_module.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => PlayerModel()),
      ChangeNotifierProvider(create: (_) => MixProvider()),
    ],
    child: MyApp(),
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
