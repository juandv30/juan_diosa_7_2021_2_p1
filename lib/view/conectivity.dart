import 'package:flutter/material.dart';

class conectivity extends StatelessWidget {
  const conectivity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          Text("Sin conexión a internet."),
          CircularProgressIndicator(),
        ],
      )),
    );
  }
}
