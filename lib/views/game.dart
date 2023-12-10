import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class GameView extends StatefulWidget {
  GameView({super.key, required this.round});

  late int round;

  @override
  State<GameView> createState() => GameViewState();
}

class GameViewState extends State<GameView> {
  // Future<void> connectToSpotifyRemote() async {
  //   var token = await getAccessToken();
  //   await SpotifySdk.connectToSpotifyRemote(
  //       clientId: "79a200d1f2f7442a9169fa3183a552af",
  //       redirectUrl: "http://localhost:3000",
  //       accessToken: token);
  // }

  String token = 'your-token-here';
  
    
  Future<void> play() async {
    final response = await http.put(
      Uri.parse('https://api.spotify.com/v1/me/player/play'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, dynamic>{
        "context_uri": "spotify:playlist:1vIrwZ44jsJP5XFrVksnLr",
        "offset": {"position": "0"},
        "position_ms": "0"
      }),
    );
    print(response.statusCode);
  }

  Future<List<dynamic>> getCurrentTrack() async {
    final response = await http.get(
        Uri.parse('https://api.spotify.com/v1/me/player/currently-playing'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        });

    List<dynamic> track = [];
    track.add(jsonDecode(response.body)['item']['name']); // titre
    track.add(
        jsonDecode(response.body)['item']['artists'][0]['name']); // artiste

    return track;
  }

  Future<void> next() async {
    await http.post(Uri.parse('https://api.spotify.com/v1/me/player/next'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }

  Future<void> pause() async {
    await http.put(Uri.parse('https://api.spotify.com/v1/me/player/pause'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        });
  }

  Future<void> toggleShuffle() async {
    await http.put(Uri.parse('https://api.spotify.com/v1/me/player/shuffle'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, bool>{"state": true}));
  }

  Future<bool> compareValues(String title, String artist) async {
    List<dynamic> track = await getCurrentTrack();
    if (track[0].toLowerCase() == title.toLowerCase() &&
        track[1].toLowerCase() == artist.toLowerCase()) {
      return true;
    } else {
      return false;
    }
  }
  // Future<String> getAccessToken() async {

  // //Access to spotify token api
  // Future<String> accessToken() async {
  // final response = await http.post(
  //   Uri.parse('https://accounts.spotify.com/api/token'),
  //   headers: <String, String>{
  //     'Content-Type': 'application/x-www-form-urlencoded',
  //   },
  //   body: jsonEncode(<String, String>{
  //     'grant_type': 'client_credentials',
  //     'client_id': '79a200d1f2f7442a9169fa3183a552af',
  //     'client_secret': 'd1f53ee245a04b77b578daa06087804f'
  //   }),
  // );

  // if (response.statusCode == 200) {
  //   var accessToken = jsonDecode(response.body).access_token;
  //   return accessToken;
  // } else {
  //   throw Exception('Access Token Error');
  // }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();

  dynamic _counter = 30;
  String _footerLabel = 'BLIND IT !';
  int maxRound = 5;

  isGameDone() {
    return widget.round >= maxRound;
  }

  // time remaining
  _timeRemaining() {
    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _counter -= 1;
        if (_counter > 0) {
          _timeRemaining();
        } else {
          _counter = 'DONE';
          _footerLabel = 'NEXT MUSIC';
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.round);
    toggleShuffle();

    if (widget.round > 1 && widget.round <= 5) {
      next();
    } else {
      play();
    }
    _timeRemaining();
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    // print(args);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.menu, size: 60, color: Color(0xff0C173E)),
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
        )),
        body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child:
                          // Container(
                          //     width: 325,
                          //     alignment: Alignment.center,
                          //     child: SizedBox(
                          //         child: Image.asset(
                          //       'assets/images/sound.gif',
                          //     ))),
                          Text(
                    _counter.toString(),
                    style: const TextStyle(fontSize: 60),
                  )),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 30, top: 40),
                      child: SizedBox(
                        width: 375,
                        height: 15,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xff33AD97),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'TITLE',
                      style: TextStyle(fontSize: 55, color: Color(0xff0C173E)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Color(0xff33AD97),
                        hintText: 'Enter the title of the song',
                        labelStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: const Text(
                      'ARTIST',
                      style: TextStyle(fontSize: 55, color: Color(0xff0C173E)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    child: TextFormField(
                      controller: _artistController,

                      decoration: const InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Color(0xff33AD97),
                        hintText: 'Enter the artist of the song',
                        labelStyle: TextStyle(color: Colors.white),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: EdgeInsets.all(20),
                      ),
                    ),
                  ),
                  // Center(
                  //   child:
                  // )
                ],
              ),
            )),
        bottomNavigationBar: Container(
            height: 100,
            color: const Color(0xff0C173E),
            child: Center(
              child: InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    String title = _titleController.text;
                    String artist = _artistController.text;

                    bool valuesMatch = await compareValues(title, artist);

                    if (valuesMatch) {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('VICTORY !!!')),
                      );

                      if (isGameDone()) {
                        // ignore: use_build_context_synchronously
                        pause();
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/game_over');
                      } else {
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, '/next_track');
                      }
                    } else {
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('RETRY :(')),
                      );
                    }
                  }
                },
                child: Text(_footerLabel,
                    style: const TextStyle(color: Colors.white, fontSize: 60)),
              ),
            )));
  }
}
