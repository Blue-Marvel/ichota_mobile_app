import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

sealed class AuthRepository {
  Future<void> login(String email, String password);
  Future continueWithGoogle();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future continueWithGoogle() async {
    try {
      const List<String> scopes = <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ];
      final googleSignIn = GoogleSignIn(
        scopes: scopes,
      );

      final String? deviceId = await _getDeviceInfo();
      log(deviceId.toString());

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      log("fdasf" + googleUser.toString());
      if (googleUser != null) {
        final userModel = (
          password: googleUser.id,
          email: googleUser.email,
          deviceId: deviceId ?? 'Unknown_Udid',
        );
        // logger.d('sent create tag');
        // return Right(googleUser);
      } else {
        // return left(ErrorMessage(message: 'Failed'));
      }
    } on SocketException catch (e) {
      log(e.toString());
      // return throw SocketException('No internet connection. $e');
    } on PlatformException catch (e) {
      log(e.toString());

      // return throw PlatformException(message: 'Failed to login. $e', code: '1');
    } catch (e) {
      log(e.toString());

      // return throw Exception('Failed to login. $e');
    }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      log("start login");
      log({
        "email": email,
        "password": password,
        "deviceId": await _getDeviceInfo(),
      }.toString());
      final response = await http.post(
          headers: {
            "Content-Type": "application/json",
          },
          Uri.parse('https://ichota-server-app.onrender.com/users/auth'),
          body: json.encode({
            "email": email,
            "password": password,
            "deviceId": await _getDeviceInfo(),
          }));

      // if (response.statusCode == 200) {
      log(" afd-------------------- ${response.statusCode} ${response.body}");
      // }
    } catch (e) {
      log(e.toString());
      // rethrow;
    }
  }

  Future<String?> _getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      log('Android Device ID: ${androidInfo.id}');
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      log('iOS Device ID: ${iosInfo.identifierForVendor}');
      return iosInfo.identifierForVendor;
    }
    return null;
  }
}
