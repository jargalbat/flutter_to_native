import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class MethodChannelHelper extends ChangeNotifier {
  MethodChannelHelper() {
    _channel.setMethodCallHandler(_handleMessage);
    _channel.invokeMethod('requestCounter');
  }

  final _channel = MethodChannel('mn.gcm/authentication');

  int _count = 0;

  int get count => _count;

  /// Хүсэлт илгээх
  void increment() {
    _channel.invokeMethod('incrementCounter');
  }

  void success() {
    _channel.invokeMethod('success', 'hello');
  }

  void failed() {
    _channel.invokeMethod('failed');
  }

  /// Хүлээн авах
  Future<dynamic> _handleMessage(MethodCall call) async {
    if (call.method == 'reportCounter') {
      _count = call.arguments as int;
      notifyListeners();
    } else if (call.method == 'getCustData') {
//      _count = call.arguments as int;
      notifyListeners();
    }
  }
}
