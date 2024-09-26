import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token;

  String? get token => _token;

  setToken(String token) async {
    _token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', token);
    notifyListeners();
  }

  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('authToken');
    notifyListeners();
  }

  Future<void> logout() async {
    _token = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
    notifyListeners();
  }
}
