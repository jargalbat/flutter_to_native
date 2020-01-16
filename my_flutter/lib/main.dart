import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter/all/api.dart';
import 'package:my_flutter/all/login_request.dart';
import 'package:my_flutter/all/login_response.dart';
import 'package:my_flutter/login_screen.dart';
import 'package:my_flutter/method_channel_helper.dart';
import 'package:my_flutter/take_picture_screen.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  // This call ensures the Flutter binding has been set up before creating the
  // MethodChannel-based model.
  WidgetsFlutterBinding.ensureInitialized();

  final model = MethodChannelHelper();

  runApp(
    ChangeNotifierProvider.value(
      value: model,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _status = '';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            Text(
              '$_status',
            ),
            Consumer<MethodChannelHelper>(
              builder: (context, model, child) {
                return Text(
                  'Taps: ${model.count}',
                  style: Theme.of(context).textTheme.headline,
                );
              },
            ),
            Consumer<MethodChannelHelper>(
              builder: (context, model, child) {
                return RaisedButton(
                  onPressed: () => model.increment(),
                  child: Text('Tap me!'),
                );
              },
            ),
            Consumer<MethodChannelHelper>(
              builder: (context, model, child) {
                return RaisedButton(
                  onPressed: () async {
                    String str = await _logaa();
                    if (str == 'success') {
                      model.success();
                    } else {
                      model.failed();
                    }
                  },
                  child: Text('Login'),
                );
              },
            ),
            RaisedButton(
              child: Text('Call login'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            RaisedButton(
              child: Text('Url launcher'),
              onPressed: () async {
                final url = 'https://flutter.dev/docs';
                if (await launcher.canLaunch(url)) {
                  launcher.launch(url);
                }
              },
            ),
            RaisedButton(
              child: Text('Camera'),
              onPressed: () async {
                // Ensure that plugin services are initialized so that `availableCameras()`
                // can be called before `runApp()`
                WidgetsFlutterBinding.ensureInitialized();

                // Obtain a list of the available cameras on the device.
                final cameras = await availableCameras();

                // Get a specific camera from the list of available cameras.
                final firstCamera = cameras.first;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TakePictureScreen(
                              camera: firstCamera,
                            )));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  _login() {
    setState(() {
      _status = 'success';
    });

    _logaa();
  }

  Future<String> _logaa() async {
    setState(() {
      _status = 'clicked';
    });

//    LoginRequest loginRequest = LoginRequest(
//        ploginName: '88989800',
//        pmobile: '88989800',
//        ppin: '4587',
//        prememberMe: true,
//        pfingerPrintFlag: 0);
//
//
//
//    LoginResponse loginResponse = await signIn(loginRequest);
//
//    if (loginResponse.responseCode == '0') {
//      setState(() {
//        _status = 'success';
//      });
//      return 'success';
//    } else {
//      setState(() {
//        _status = loginResponse.responseDesc;
//      });
//      return 'failed';
//    }

    return 'success';
  }

  Api _api = new Api();

  Future<LoginResponse> signIn(LoginRequest request) async {
    return LoginResponse.fromJson((await _api.post(request)).data);
  }

  _camera() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

// Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;
  }
}
