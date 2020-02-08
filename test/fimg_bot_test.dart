import 'dart:io';
import 'dart:typed_data';

import 'package:test/test.dart';
import 'package:fimg_bot/fimg_bot.dart';

void main() {
  test('getfirst', () async {
    var bytes = await getFirstImage('Discentra', 2);

      var fileCopy = await File('data-copy.png').writeAsBytes(bytes.toList());
      print(await fileCopy.exists());
      print(await fileCopy.length());
  });
}
