import 'package:flutter/material.dart';
import 'package:parcial_meme/model/meme_model.dart';

class DetailsMeme extends StatelessWidget {
  final Meme meme;
  const DetailsMeme({Key? key, required this.meme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(meme.url.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              height: height * 0.4,
              width: double.infinity,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                color: Color(0xFF25a974),
                border: Border(
                  left: BorderSide(
                    color: Colors.green,
                    width: 3,
                  ),
                ),
              ),
              height: height * 0.1,
              width: double.infinity,
            ),
            Expanded(
              child: Container(
                height: height * 0.2,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "ID",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Text(
                            "meme.numide.toString()",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fecha ingreso",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("meme.fechaing",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Cod valor",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text("meme.codtipovalor.toString()",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ]),
                  ],
                ),
              ),
            ),
            MaterialButton(
              color: Color(0xFF25a974),
              onPressed: () async => {
                Navigator.pop(context),
              },
              child: const Text("Regresar"),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
