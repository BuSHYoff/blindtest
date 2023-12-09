import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GameView extends StatefulWidget {
  const GameView({super.key});

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

  Future<void> play() async {
    final response = await http.put(
      Uri.parse('https://api.spotify.com/v1/me/player/play'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization':
            'Bearer ...',
      },
      body: jsonEncode(<String, dynamic>{
        "context_uri": "spotify:playlist:0vKSE9DIM3OLlgLeDoaFEm",
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
          'Authorization':
              'Bearer ...',
        });

    List<dynamic> track = [];
    track.add(jsonDecode(response.body)['item']['name']); // titre
    track.add(
        jsonDecode(response.body)['item']['artists'][0]['name']); // artiste

    return track;
  }

  Future<bool> compareValues(String title, String artist) async {
    List<dynamic> track = await getCurrentTrack();
    if (track[0] == title && track[1] == artist) {
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

  @override
  void initState() {
    super.initState();
    play();
  }

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _artistController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Container(
                      width: 325,
                      alignment: Alignment.center,
                      child: SizedBox(
                          child: Image.asset(
                        'assets/images/sound.gif',
                      ))),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 75),
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
                      style: TextStyle(
                          fontFamily: 'LilitaOne',
                          fontSize: 55,
                          color: Color(0xff0C173E)),
                    ),
                  ),
                  TextFormField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter the title of the song',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter a title';
                      }
                      return null;
                    },
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text(
                      'ARTIST',
                      style: TextStyle(
                          fontFamily: 'LilitaOne',
                          fontSize: 55,
                          color: Color(0xff0C173E)),
                    ),
                  ),
                  TextFormField(
                    controller: _artistController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter the artist of the song',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter an artist';
                      }
                      return null;
                    },
                  ),
                  // Align(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Padding(
                  //         padding: const EdgeInsets.only(top: 75),
                  //         child: Container(
                  //             width: 500,
                  //             height: 62.9,
                  //             color: const Color(0xff0C173E)))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextButton(
                          onPressed: play,
                          child: const Text('PLAY TRACK'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              String title = _titleController.text;
                              String artist = _artistController.text;

                              bool valuesMatch = await compareValues(title, artist);

                              if (valuesMatch) {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('VICTORY !!!')),
                                );
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('RETRY :(')),
                                );
                              }
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(context, '/next_track');
                            }
                          },
                          child: const Text('Submit'),
                        ),
                        TextButton(
                          onPressed: getCurrentTrack,
                          child: const Text('GET TRACK'),
                        ),
                      ])
                ],
              ),
            )));
  }
}
