import 'dart:convert' as convert;
import 'package:parcial_meme/model/meme_model.dart';
import 'package:http/http.dart' as http;

Future<List<Meme>> getMemes() async {
  Uri url = Uri.parse('https://api.doge-meme.lol/v1/memes/?skip=0&limit=100');
  var response = await http.get(
    url,
    headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
    },
  );
  List<Meme> _meme = [];
  if (response.statusCode == 200) {
    // print(response.body);
    final jsonData = convert.jsonDecode(response.body);

    for (var item in jsonData['data']) {
      var url;
      if (item['submission_url'].toUpperCase().contains("JPG") ||
          item['submission_url'].toUpperCase().contains("PNG")) {
        url = item['submission_url'].toString();
      } else {
        url = "https://www.allianceplast.com/wp-content/uploads/no-image.png";
      }
      _meme.add(Meme(
        title: item['submission_title'].toString(),
        url: url,
        id: item['submission_id'].toString(),
        autor: item['author'].toString(),
        create: item['created'].toString(),
        timestamp: item['timestamp'].toString(),
      ));
    }
  } else {
    print(response.hashCode);
  }

  return _meme;
}
