library getsocket;

import 'src/html.dart' if (dart.library.io) 'src/io.dart';

class GetSocket extends BaseWebSocket {
  GetSocket(String url, {Duration ping}) : super(url, ping: ping);
}
