import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:html/parser.dart'; // Contains HTML parsers to generate a Document object
import 'package:html/dom.dart'; // Contains DOM related classes for extracting data from elements

Future<Uint8List> getFirstImage(String keyword) async {
  var client = Client();
  var response =
      await client.get('https://www.google.co.jp/search?q=${keyword}&tbm=isch');
  var document = parse(response.body);
  var imgRes = await get(
    document.querySelectorAll('img')[4].attributes['src']
  );
  var bytes = imgRes.bodyBytes;
  return bytes;
}
