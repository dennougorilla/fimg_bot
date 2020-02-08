import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object

Future<Uint8List> getFirstImage(String keyword, [int number = 0]) async {
  var client = Client();
  var response =
      await client.get('https://www.google.co.jp/search?q=${keyword}&tbm=isch');
  var document = parse(response.body);
  var results = document
      .querySelectorAll('img')
      .where((img) => img.attributes['style'] != null).toList();
  var imgRes = await get(results[number].attributes['src']);
  var bytes = imgRes.bodyBytes;
  return bytes;
}
