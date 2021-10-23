import 'package:flutter/material.dart';
import 'package:parcial_meme/view/view_meme.dart';

import 'data/meme_data.dart';

void main() {
  //getmeme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ViewMeme());
  }
}
