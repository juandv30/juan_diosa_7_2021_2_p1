import 'package:flutter/material.dart';
import 'package:parcial_meme/data/meme_data.dart';
import 'package:parcial_meme/model/meme_model.dart';
import 'package:parcial_meme/view/tarjet.dart';

class ViewMeme extends StatefulWidget {
  const ViewMeme({Key? key}) : super(key: key);

  @override
  _ViewMemeState createState() => _ViewMemeState();
}

class _ViewMemeState extends State<ViewMeme> {
  List<Meme> _listmeme = [];
  @override
  initState() {
    allMemes();
    super.initState();
  }

  allMemes() async {
    _listmeme = await getMemes();
    setState(() {
      _listmeme;
    });
    print("Prueba" + _listmeme.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Memes"))),
        body: SafeArea(
            child: Column(
          children: [
            _listMemes(),
          ],
        )));
  }

  Widget _listMemes() {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: _listmeme.length,
      itemBuilder: (BuildContext context, int index) {
        Meme meme = _listmeme[index];
        return Tarjet(meme: meme);
      },
    ));
  }
}
