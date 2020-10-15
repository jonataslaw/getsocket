## [1.0.0] 
* Stable release 
* Breaking Changes:
  
Before:
socket.onOpen = () {
    print('onOpen');
};

now:
socket.onOpen((){
    print('onOpen');
});

Before:
socket.onMessage = (message) {
    print('message');
};

now:
socket.onMessage((message){
    print('message');
});

Before:
socket.onClose = (int code, String reason) {
    print('Closed by server [$code => $reason]!');
};

now:
socket.onClose((close) {
    print(close.message);
});

Added emit/on events
socket.on('event', (val) {
    print(val);
});

socket.emit('event', 'your data');

Integration with GetServer (https://pub.dev/packages/get_server)


## [0.0.1] 

* Initial release
