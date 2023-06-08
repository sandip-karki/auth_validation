import 'package:flutter/material.dart';
import 'package:student/domain/auth_repo_impl.dart';

class AuthProvider with ChangeNotifier {
  AuthRepoImpl? _repo;
  AuthProvider() {
    _repo = AuthRepoImpl();
  }

  bool _isLoading = false;
  bool get isLoding => _isLoading;
  String _loadingText = ' please wait..';
  String get loadingText => _loadingText;
  Future<String> login(
      {required String email, required String password}) async {
    _isLoading = true;
    _loadingText = 'Logging in...';
    notifyListeners();
    String result = 'ok';
    try {
      final res = await _repo!.login(email: email, password: password);
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<String> register(
      {required String email,
      required String password,
      required String name}) async {
    _isLoading = true;
    _loadingText = 'Creating user..';

    notifyListeners();
    String result = 'ok';
    try {
      final res =
          await _repo!.register(email: email, password: password, name: name);
      print(res);
    } catch (e) {
      result = e.toString();
    }
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
