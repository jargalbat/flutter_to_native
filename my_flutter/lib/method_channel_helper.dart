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

  void increment() {
    _channel.invokeMethod('incrementCounter');
  }

  Future<dynamic> _handleMessage(MethodCall call) async {
    if (call.method == 'reportCounter') {
      _count = call.arguments as int;
      notifyListeners();
    }
  }
}
