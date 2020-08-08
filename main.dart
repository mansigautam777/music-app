import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';

import 'package:chewie/chewie.dart';

import 'package:video_player/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/music': (_) => music(), '/video': (_) => video()},
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey.shade800,
            leading: Image.asset('assets/music.jpg'),
            title: Text(
              'MUSIC APP',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
          body: Builder(builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Container(
                  color: Colors.grey.shade600,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Play On My Way !!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: Image.asset('assets/on_my_way_image.jpg'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.music_note,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/music');
                              }),
                          IconButton(
                              icon: Icon(
                                Icons.music_video,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed('/video');
                              }),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            );
          })),
    );
  }
}

// ignore: camel_case_types
class music extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AudioPlayer player = new AudioPlayer();

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/on_my_way_image.jpg',
                  fit: BoxFit.contain,
                ),
                Text(
                  'On My Way',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () async {
                  player = await AudioCache().loop("on_my_way.mp3");
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.pause_circle_outline,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await player.pause();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.stop,
                  color: Colors.white,
                ),
                onPressed: () async {
                  await player.stop();
                },
              ),
            ],
          ),
        ],
      ),
    );

    var myappbar = AppBar(
      backgroundColor: Colors.grey.shade600,
      leading: Image.asset('assets/music.jpg'),
      title: Text(
        'MUSIC APP',
        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: myappbar,
          body: mybody,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              backgroundColor: Colors.white)),
    );
  }
}

// ignore: camel_case_types
class video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final videoPlayerController = VideoPlayerController.network(
        "https://drive.google.com/file/d/1vSe6aXbbHcAO2ym-0XRA0-P11NQ_6tVi/view?usp=sharing");

    final chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true);

    var mybody = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipRRect(
            child: Chewie(
              controller: chewieController,
            ),
          ),
        ],
      ),
    );

    var myappbar = AppBar(
      backgroundColor: Colors.grey.shade800,
      leading: Image.asset('assets/music.jpg'),
      title: Text(
        'MUSIC APP',
        style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
      ),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: myappbar,
          body: mybody,
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              backgroundColor: Colors.white)),
    );
  }
}
