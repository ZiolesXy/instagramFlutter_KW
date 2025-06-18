import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static const String _userKey = 'current_user';
  static const String _isLoggedInKey = 'is_logged_in';

  // Mendaftarkan user baru
  Future<bool> register(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Cek apakah username sudah ada
    final existingUser = prefs.getString('user_$username');
    if (existingUser != null) {
      return false;
    }
    
    // Simpan user baru
    final user = UserModel(username: username, password: password);
    await prefs.setString('user_$username', json.encode(user.toJson()));
    
    // Set sebagai user yang sedang login
    await prefs.setString(_userKey, json.encode(user.toJson()));
    await prefs.setBool(_isLoggedInKey, true);
    
    return true;
  }

  // Login user
  Future<bool> login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Cek apakah user ada
    final userJson = prefs.getString('user_$username');
    if (userJson == null) {
      return false;
    }
    
    // Verifikasi password
    final user = UserModel.fromJson(json.decode(userJson));
    if (user.password != password) {
      return false;
    }
    
    // Set sebagai user yang sedang login
    await prefs.setString(_userKey, userJson);
    await prefs.setBool(_isLoggedInKey, true);
    
    return true;
  }

  // Logout user
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Mendapatkan user yang sedang login
  Future<UserModel?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson == null) {
      return null;
    }
    return UserModel.fromJson(json.decode(userJson));
  }

  // Cek apakah user sudah login
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }
} 