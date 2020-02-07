import 'dart:io';

import 'package:fimg_bot/fimg_bot.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx/Vm.dart';
import 'package:test/test.dart';

void main() async {
  Nyxx bot = NyxxVm(Platform.environment['DISCORD_TOKEN']);

  bot.onMessageReceived.listen((MessageEvent e) async {
    var message = e.message.toString().split(' ');
    if (message[0] == '!fimg') {
      if (message.length > 1) {
        try {
          if (message[1] == null) throwsException;
          var bytes = await getFirstImage(message[1]);
          await e.message.channel.send(
              files: [AttachmentBuilder.bytes(bytes, message[1] + '.png')]);
        } catch (e) {
          await e.message.channel.send(content: 'Error');
        }
      } else {
        await e.message.channel.send(content: 'Please keyword😅');
      }
    }
  });
}
