import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

sealed class AuthRepository {
  Future<void> login(String email, String password);
  Future continueWithGoogle();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future continueWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      final String? deviceId = await _getDeviceInfo();

      if (googleUser != null) {
        final userModel = (
          password: googleUser.id,
          email: googleUser.email,
          deviceId: deviceId ?? 'Unknown_Udid',
        );
        log(userModel.toString());
        // logger.d('sent create tag');
        // return Right(googleUser);
      } else {
        // return left(ErrorMessage(message: 'Failed'));
      }
    } on SocketException catch (e) {
      return throw SocketException('No internet connection. $e');
    } on PlatformException catch (e) {
      return throw PlatformException(message: 'Failed to login. $e', code: '1');
    } catch (e) {
      return throw Exception('Failed to login. $e');
    }
  }

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
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
