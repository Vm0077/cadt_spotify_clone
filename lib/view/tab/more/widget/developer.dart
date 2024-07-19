import 'package:flutter/material.dart';

class Developer {
  final String name;
  final String title;
  final String bio;
  final List<String> skills;
  final String imagePath;

  Developer({
    required this.name,
    required this.title,
    required this.bio,
    required this.skills,
    required this.imagePath,
  });
}

class DeveloperMembersPage extends StatelessWidget {
  final List<Developer> developers = [
    Developer(
      name: 'You Chanvichea',
      title: 'Flutter Developer',
      bio:
          'You Chanvichea is a passionate Flutter developer with 1 years of experience in building cross-platform mobile applications. He enjoys creating beautiful and functional user interfaces.',
      skills: ['Dart', 'Flutter', 'Firebase', 'REST APIs'],
      imagePath: 'https://th.bing.com/th/id/OIP.OgRB0U7cw81ZoY9UyZVWvAHaHa?rs=1&pid=ImgDetMain',
    ),
    Developer(
      name: 'Chea Chunheang',
      title: 'Flutter Developer',
      bio:
          'Chea Chunheang is a passionate Flutter developer with 1 years of experience in building cross-platform mobile applications. He enjoys creating beautiful and functional user interfaces.',
      skills: ['Dart', 'Flutter', 'Firebase', 'REST APIs'],
      imagePath: 'https://th.bing.com/th/id/OIP.OgRB0U7cw81ZoY9UyZVWvAHaHa?rs=1&pid=ImgDetMain',
    ),
    Developer(
      name: 'Vann Nuth',
      title: 'Flutter Developer',
      bio:
          'Vann Nuth is a passionate Flutter developer with 1 years of experience in building cross-platform mobile applications. He enjoys creating beautiful and functional user interfaces.',
      skills: ['Dart', 'Flutter', 'Firebase', 'REST APIs'],
      imagePath: 'https://th.bing.com/th/id/OIP.OgRB0U7cw81ZoY9UyZVWvAHaHa?rs=1&pid=ImgDetMain',
    ),
    Developer(
      name: 'Rim Kunvath',
      title: 'Flutter Developer',
      bio:
          'Rim Kunvath is a passionate Flutter developer with 1 years of experience in building cross-platform mobile applications. He enjoys creating beautiful and functional user interfaces.',
      skills: ['Dart', 'Flutter', 'Firebase', 'REST APIs'],
      imagePath: 'https://th.bing.com/th/id/OIP.OgRB0U7cw81ZoY9UyZVWvAHaHa?rs=1&pid=ImgDetMain',
    ),
  ];

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
            icon: Icon(Icons.arrow_back_ios_sharp, color: 
            Colors.white,)),
        title: Text('Developer Team', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: developers.length,
        itemBuilder: (context, index) {
          final developer = developers[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(developer.imagePath),
            ),
            title: Text(developer.name, style: TextStyle(color: Colors.white),),
            subtitle: Text(developer.title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DeveloperMemberPage(developer: developer),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DeveloperMemberPage extends StatelessWidget {
  final Developer developer;

  DeveloperMemberPage({required this.developer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp, color: 
            Colors.white,)),
        backgroundColor: Colors.black,
        title: Text(developer.name, style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(developer.imagePath),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                developer.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                developer.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400],
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Bio:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              developer.bio,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Skills:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: developer.skills
                  .map((skill) =>
                      Text('• $skill', style: TextStyle(fontSize: 16, color: Colors.grey[600],)))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
