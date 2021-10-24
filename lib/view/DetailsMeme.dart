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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(meme.url.toString()),
                    fit: BoxFit.cover,
                  ),
                ),
                height: height * 0.4,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Container(
                height: height * 0.2,
                width: double.infinity,
                child: Column(
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
                            meme.id.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 18),
                          ),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Autor",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(meme.autor.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Creado",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(meme.create.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18)),
                        ]),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tiempo",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          Text(meme.timestamp.toString(),
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
