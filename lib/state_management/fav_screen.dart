import 'package:flutter/material.dart';
import 'package:mb_spotify_pr/state_management/library_list.dart';
import 'package:provider/provider.dart';

class FavoriteMixesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white,)),
        title: Text(
          'Favorite Mixes',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<MixProvider>(
        builder: (context, mixProvider, child) {
          return ListView.builder(
            itemCount: mixProvider.favoriteMixes.length,
            itemBuilder: (context, index) {
              final mix = mixProvider.favoriteMixes[index];
              return ListTile(
                leading: Image.asset(mix['image'],),
                title: Text(mix['title'], style: TextStyle(color: Colors.white),),
                subtitle: Text(mix['description']),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    mixProvider.removeFromFavorites(mix);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
