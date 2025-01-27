import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ichota_mobile_app/features/auth/repository/auth_repository.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider();
});

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;

  AuthRepository repository = AuthRepositoryImpl();

  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();
    await repository.login(email, password);
    isLoading = false;
    notifyListeners();
  }

  Future<void> continueWithGoogle() async {
    isLoading = true;
    notifyListeners();
    await repository.continueWithGoogle();
    isLoading = false;
    notifyListeners();
  }
}
