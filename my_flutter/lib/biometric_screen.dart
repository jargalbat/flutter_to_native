import 'dart:io';

import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as auth_error;

class BiometricScreen extends StatefulWidget {
  @override
  _BiometricScreenState createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  var localAuth;

  @override
  void initState() {
    super.initState();

    localAuth = LocalAuthentication();
  }

  @override
  void dispose() {
    localAuth.stopAuthentication();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('biometric'),
      ),
      body: RaisedButton(
        child: Text('Biometric test'),
        onPressed: () async {
          _biometric();
        },
      ),
    );
  }

  _biometric() async {
//    bool didAuthenticate =
//    await localAuth.authenticateWithBiometrics(
//        localizedReason: 'Please authenticate to show account balance');

    bool canCheckBiometrics = await localAuth.canCheckBiometrics;

    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (Platform.isIOS) {
      if (availableBiometrics.contains(BiometricType.face)) {
        // Face ID.
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        // Touch ID.
      }
    }

    try {
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
        localizedReason: 'Please authenticate to show account balance',
        useErrorDialogs: false,
        stickyAuth: true,
      );

      print(didAuthenticate);
    } on PlatformException catch (e) {
      if (e.code == auth_error.notAvailable) {
        // Handle this exception here.
        print('exeeee');
      }
    }

//    localAuth.stopAuthentication();
  }
}
