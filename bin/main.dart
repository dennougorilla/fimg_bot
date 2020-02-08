import 'dart:io';

import 'package:fimg_bot/fimg_bot.dart';
import 'package:nyxx/nyxx.dart';
import 'package:nyxx/Vm.dart';

void main() async {
  Nyxx bot = NyxxVm(Platform.environment['DISCORD_TOKEN']);

  bot.onMessageReceived.listen((MessageEvent e) async {
    var message = e.message.toString().split(' ');
    if (message[0] == '!fimg') {
      try {
        switch (message.length) {
          case 2:
            var bytes = await getFirstImage(message[1]);
            await e.message.channel.send(
                files: [AttachmentBuilder.bytes(bytes, message[1] + '.png')]);
            break;
          case 3:
            var bytes = await getFirstImage(message[1], int.parse(message[2]));
            await e.message.channel.send(
                files: [AttachmentBuilder.bytes(bytes, message[1] + '.png')]);
            break;
          default:
            await e.message.channel.send(content: 'Error');
            break;
        }
      } catch (e) {
        await e.message.channel.send(content: 'Error');
      }
    }
  });
}
