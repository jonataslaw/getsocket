import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getsocket/getsocket.dart';

void main() {
  Get.lazyPut(() => Controller());
  runApp(
    MaterialApp(
      home: MyHomePage(),
    ),
  );
}

class Controller extends GetNotifier {
  Controller() : super('');
  GetSocket socket = GetSocket("http://127.0.0.1:8080/socket");
  String text = '';

  @override
  void onInit() {
    print('onInit called');

    socket.onOpen(() {
      print('onOpen');
      change(value, status: RxStatus.success());
    });

    socket.onMessage((data) {
      print('message received: $data');
      change(data);
    });

    socket.onClose((close) {
      print('close called');
      change(value, status: RxStatus.error(close.message));
    });

    socket.onError((e) {
      print('error called');
      change(value, status: RxStatus.error(e.message));
    });

    socket.on('event', (val) {
      print(val);
    });

    socket.emit('event', 'you data');

    socket.connect();
  }

  void sendMessage() {
    if (text.isNotEmpty) {
      socket.emit('message', text);
    }
  }
}

class MyHomePage extends GetView<Controller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Websocket test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              onChanged: (val) => controller.text = val,
              decoration: InputDecoration(labelText: 'Send a message'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: controller.call(
                (state) => Text(state),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
