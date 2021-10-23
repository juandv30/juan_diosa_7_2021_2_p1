import 'package:flutter/material.dart';
import 'package:parcial_meme/model/meme_model.dart';
import 'package:parcial_meme/view/DetailsMeme.dart';

class Tarjet extends StatelessWidget {
  final Meme meme;
  const Tarjet({
    required this.meme,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                leading: CircleAvatar(
                  radius: 26,
                  backgroundColor: Color(0xFF25a974),
                  child: ClipOval(
                      child: Text(meme.title.toString()[0].toUpperCase())),
                ),
                title: Text(meme.title.toString().toUpperCase()),
                subtitle: Text(meme.url.toString()),
              ),
            ],
          ),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailsMeme(
                  meme: meme,
                );
              },
            )));
  }
}
