import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _baseUrlUserRef = 'flutter-ads-app-default-rtdb.firebaseio.com';

  final String _firebaseToken = 'AIzaSyAxQ7qQQGV7E2_wLwIyr_D9lkXNlFv1HgA';

  final storage = new FlutterSecureStorage();

  Future<String?> createUser(String email, String password, String name) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    // createUserInDb(email, name);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      // decodedResp['idToken'];
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future createUserInDb(String email, String name) async {
    final url = Uri.https(_baseUrlUserRef, 'users.json');

    final Map data = {'email': email, 'name': name};

    final resp = await http.post(url, body: json.encode(data));

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    if (decodedData.containsKey('name')) {
      print('...saving id user...');
      await storage.write(key: 'id_user', value: decodedData['name']);
    }

    print(decodedData);
  }

  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true,
      "expiresIn": "36000",
      "displayName": "Test",
    };

    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  Future logout() async {
    await storage.delete(key: 'token');
    await storage.delete(key: 'id_user');
    return;
  }

  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
