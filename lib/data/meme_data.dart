import 'dart:convert' as convert;
import 'package:parcial_meme/model/meme_model.dart';
import 'package:http/http.dart' as http;

Future<List<Meme>> getMemes() async {
  Uri url = Uri.parse('https://api.doge-meme.lol/v1/memes/?skip=0&limit=100');
  var response = await http.get(url);
  List<Meme> _meme = [];
  if (response.statusCode == 200) {
    // print(response.body);
    final jsonData = convert.jsonDecode(response.body);

    for (var item in jsonData['data']) {
      _meme.add(Meme(
        title: item['submission_title'].toString(),
        url: item['submission_url'].toString(),
        id: item['submission_id'].toString(),
        autor: item['author'].toString(),
      ));
    }
  } else {
    print(response.hashCode);
  }

  return _meme;
}
