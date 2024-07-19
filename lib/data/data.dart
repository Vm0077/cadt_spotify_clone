import "package:flutter/material.dart";
import "classes.dart";

final List<Map<String, dynamic>> slider = [
  {
    "title": "30 Fresh music for you every week ",
    "image": "assets/images/yourDiscover.png",
  },
  {
    "title": "New songs every friday",
    "image": "assets/images/friday.png",
  },
];

final List<Map<String, dynamic>> topMixes = [
  {
    "title": "Hip Hop Mix",
    "description": "Juice Wrld, Drake, Kendrick lamar and more... ",
    "image": "assets/images/music1.png",
    "color": "#EF0CAF"
  },
  {
    "title": "Moody Mix",
    "description": "Joji, The Kid LAROI, Tate McRae and more...",
    "image": "assets/images/music2.png",
    "color": "#FFFF00"
  },
  {
    "title": "House Mix",
    "description": "Martin Garrix, The Chainsmoker and more...",
    "image": "assets/images/music3.png",
    "color": "#1ED760"
  },
];

final List<Map<String, dynamic>> podcasts1 = [
  {
    "title": "The Joe Rogan Experience",
    "description":
        "Join comedian Joe Rogan as he hosts long-form conversations with friends and guests that include comedians, actors, musicians, MMA fighters, authors, artists, and beyond. This podcast covers a wide range of topics from current events and politics to comedy and philosophy, providing insightful and often entertaining discussions.",
    "image": "https://i.scdn.co/image/8a75a57db8d7a98f7edaa09e7f71a724a45dfb4a",
    "color": Color.fromARGB(255, 115, 81, 68)
  },
  {
    "title": "MrBallen Podcast: Strange, Dark & Mysterious Stories",
    "description":
        "Dive into the eerie and gripping world of MrBallen as he tells true, strange, dark, and mysterious stories. From unsolved mysteries and bizarre events to paranormal activities and spine-chilling experiences, MrBallen captivates listeners with his storytelling prowess and attention to detail.",
    "image": "https://i.scdn.co/image/ab6765630000ba8abb1a6035aba5f0bf498671fe",
    "color": Color.fromARGB(255, 9, 133, 166)
  },
  {
    "title": "Tech Talk",
    "description":
        "Stay ahead in the tech world with 'Tech Talk', a podcast featuring in-depth discussions on the latest trends, innovations, and breakthroughs in technology. Hosted by industry experts, this podcast covers everything from software development and cybersecurity to artificial intelligence and emerging technologies.",
    "image": "https://i.scdn.co/image/ab67656300005f1fe2f1a4f59db68c3895bab4f6",
    "color": Color.fromARGB(255, 87, 108, 67)
  },
  {
    "title": "Health & Wellness",
    "description":
        "Embark on a journey towards a healthier lifestyle with 'Health & Wellness'. This podcast offers expert advice, practical tips, and inspirational stories on nutrition, fitness, mental health, and overall well-being. Whether you're looking to improve your diet, start a new workout routine, or boost your mental health, this podcast has something for everyone.",
    "image": "https://i.scdn.co/image/ab67656300005f1fe269539a78621316210809ea",
    "color": Color.fromARGB(255, 94, 64, 108)
  },
  {
    "title": "True Crime Stories",
    "description":
        "Explore the most fascinating and perplexing true crime cases with 'True Crime Stories'. This podcast delves into the details of infamous murders, unsolved mysteries, and criminal investigations, providing a thorough analysis and compelling narrative that keeps listeners on the edge of their seats.",
    "image": "https://i.scdn.co/image/ab67656300005f1f8924ecbdb2d250e264faa730",
    "color": Color.fromARGB(255, 115, 81, 68)
  },
];

List<Map<String, dynamic>> artists = [
  {
    'image': 'https://i.scdn.co/image/ab6761610000e5eb437b9e2a82505b3d93ff1022',
    'name': 'Kendrick Lamar'
  },
  {
    'image': 'https://i.scdn.co/image/ab67616d00001e020b04da4f224b51ff86e0a481',
    'name': 'Taylor Swift'
  },
  {
    'image': 'https://i.scdn.co/image/ab6761610000e5ebe17c0aa1714a03d62b5ce4e0',
    'name': 'Post Malone'
  },
  {
    'image': 'https://i.scdn.co/image/ab67616d0000b2732a038d3bf875d23e4aeaa84e',
    'name': 'Billie Eilish'
  },
  {
    'image': 'https://i.scdn.co/image/ab6761610000e5eb4293385d324db8558179afd9',
    'name': 'Drake'
  },
  {
    'image':
        'https://image-cdn-ak.spotifycdn.com/image/ab67706c0000da848f44fad216defef46f4ee31d',
    'name': 'Ariana Grande'
  },
  {
    'image': 'https://i.scdn.co/image/ab6761610000e5eb3bcef85e105dfc42399ef0ba',
    'name': 'Ed Sheeran'
  }
];

List<String> searchList = [
  'The Kid LAROI',
  'Drake',
  'Justin Bieber',
  'Joji',
  'Hip Hop',
  'Pop',
  'Top-Hits'
];

final List<Map<String, dynamic>> podCast = [
  {
    "title": "Impaulsive",
    "description": "334 ep.",
    "image": "assets/images/impaulsive.png",
  },
  {
    "title": "TED Talks Daily",
    "description": "155 ep.",
    "image": "assets/images/tedTalk.png",
  },
  {
    "title": "Mom’s Basement",
    "description": "75 ep.",
    "image": "assets/images/momsBasement.png",
  },
];

final List<Map<String, dynamic>> playList = [
  {
    'image_1': 'assets/images/playList1.png',
    'image_2': 'assets/images/playList2.png',
    'image_3': 'assets/images/playList3.png',
    'image_4': 'assets/images/playList4.png',
    'title': 'Playlist #1'
  },
  {
    'image_1': 'assets/images/playList5.png',
    'image_2': 'assets/images/playList6.png',
    'image_3': 'assets/images/playList7.png',
    'image_4': 'assets/images/playList8.png',
    'title': 'Playlist #2'
  },
  {
    'image_1': 'assets/images/playList9.png',
    'image_2': 'assets/images/playList10.png',
    'image_3': 'assets/images/playList11.png',
    'image_4': 'assets/images/playList12.png',
    'title': 'Playlist #3'
  },
  {
    'image_1': 'assets/images/playList13.png',
    'image_2': 'assets/images/playList14.png',
    'image_3': 'assets/images/playList3.png',
    'image_4': 'assets/images/playList16.png',
    'title': 'Playlist #4'
  },
];

final List<Map<String, dynamic>> topHit = [
  {
    'image': 'assets/images/music1.png',
    'title': 'stay',
    'description': 'The Kid LAROI, Justin Bieber',
    'favorite': true,
  },
  {
    'image': 'assets/images/wishingWall.png',
    'title': 'Wishing Well',
    'description': 'Juice WLRD',
    'favorite': false,
  },
  {
    'image': 'assets/images/jack.png',
    'title': 'First Class',
    'description': 'Jack Harlow',
    'favorite': true,
  },
  {
    'image': 'assets/images/Frame1.png',
    'title': 'Unstable',
    'description': 'Justin Bieber, The Kid LAROI',
    'favorite': false,
  },
  {
    'image': 'assets/images/Group25.png',
    'title': 'Unstable',
    'description': 'Justin Bieber, The Kid LAROI',
    'favorite': false,
  },
];

const PlayList pl1 = PlayList(
    title: "Hip-Hop Classic",
    cover: "https://i.scdn.co/image/ab67706f00000002d56955aeca2541ee8d9cd026",
    type: "Hip-Hop",
    description: "get the real hip hop experience through the history",
    songs: [
      Song(
          title: "Alright",
          artist: "Kendrick Lamar",
          type: "Hip-Hop",
          cover:
              "https://i.scdn.co/image/ab67616d0000b273cdb645498cd3d8a2db4d05e1"),
      Song(
          title: "One Beer",
          artist: "MF Doom",
          type: "Hip-Hop",
          cover:
              "https://media.pitchfork.com/photos/65fb322409c7048f78ef661c/master/w_1280%2Cc_limit/Madvillainy.jpg"),
      Song(
          title: "Many Men",
          artist: "50 Cent",
          type: "Hip-Hop",
          cover: "https://i1.sndcdn.com/artworks-tdpvjvnr3tpT-0-t500x500.jpg"),
      Song(
          title: "N.Y. State of Mind",
          artist: "Nas",
          type: "Hip-Hop",
          cover:
              "https://upload.wikimedia.org/wikipedia/en/2/27/IllmaticNas.jpg"),
    ]);

const PlayList pl2 = PlayList(
    title: "Night Drive",
    cover: "https://i.scdn.co/image/ab67706f000000023df638bf5c33922ceb4c185a",
    type: "R&B, City-Pop",
    description: "vibing with at night through driving",
    songs: [
      Song(
          title: "Night",
          artist: "Frank Ocean",
          type: "R&B",
          cover:
              "https://best-fit.transforms.svdcdn.com/production/albums/frank-ocean-blond-compressed-0933daea-f052-40e5-85a4-35e07dac73df.jpg?w=1200&h=1200&q=100&auto=format&fit=crop&dm=1643652677&s=3f177eac28ab76a7197a764624863b2a"),
      Song(
          title: "Blinding Light",
          artist: "The Weeknd",
          type: "City-Pop",
          cover:
              "https://upload.wikimedia.org/wikipedia/en/e/e6/The_Weeknd_-_Blinding_Lights.png"),
      Song(
          title: "Out of Time",
          artist: "The Weekend",
          type: "City-Pop",
          cover: "https://i1.sndcdn.com/artworks-nFL94gj3PZsO-0-t500x500.jpg"),
    ]);

const music_playlist = <PlayList>[
  pl1,
  pl2,
];
