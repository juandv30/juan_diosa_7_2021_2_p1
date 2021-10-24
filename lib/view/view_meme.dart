import 'package:flutter/material.dart';
import 'package:parcial_meme/data/meme_data.dart';
import 'package:parcial_meme/model/meme_model.dart';
import 'package:parcial_meme/view/conectivity.dart';
import 'package:parcial_meme/view/tarjet.dart';
import 'package:connectivity/connectivity.dart';

class ViewMeme extends StatefulWidget {
  const ViewMeme({Key? key}) : super(key: key);

  @override
  _ViewMemeState createState() => _ViewMemeState();
}

class _ViewMemeState extends State<ViewMeme> {
  List<Meme> _listmeme = [];
  bool swconection = true;
  @override
  initState() {
    allMemes();
    super.initState();
  }

  allMemes() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      swconection = false;
      /*  Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return conectivity();
        },
      )); */
      _showMaterialDialog();
    } else {
      swconection = true;
      _listmeme = await getMemes();
      setState(() {
        _listmeme;
      });
      print("Prueba" + _listmeme.toString());
    }
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

  void _showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Material Dialog'),
            content: Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              /*         TextButton(
               onPressed: () {
                   _dismissDialog();
                  },
                 child: Text('Close')),
               TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  _dismissDialog();
                },
                child: Text('HelloWorld!'),
           */
            ],
          );
        });
  }
}
