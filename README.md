# GetSocket

A extra light package to Websockets on Flutter/Getx to Android, iOS, Web, Windows, Mac and Linux

## Getting Started

Create a instance of GetSocket with the uri from your server. use http/https scheme
Example:

```dart
GetSocket socket = GetSocket("http://127.0.0.1:8080/socket"); // ow https to wss
```
Create events from opening, messages, close and error:

To listen socket opening:

```dart
// To listen socket open
    socket.onOpen(() {
      print('onOpen');
      change(value, status: RxStatus.success());
    });

// To listen messages
    socket.onMessage((data) {
      print('message received: $data');
      change(data);
    });

// To listen onClose events
    socket.onClose((close) {
      print('close called');
      change(value, status: RxStatus.error(close.message));
    });

// To listen errors
    socket.onError((e) {
      print('error called');
      change(value, status: RxStatus.error(e.message));
    });

// To listen events
    socket.on('joined', (val) {
      print(val);
    });

// To emit events
    socket.emit('event', 'you data');

// And lastly and most importantly, to connect to your Socket.
// DON'T FORGET TO CALL CONNECT, it will start connection
    socket.connect();
```
