// ignore_for_file: prefer_const_constructors

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = FlutterSecureStorage();

  Future writeSecureData(String key, String value) async {
    var writingData = await _storage.write(key: key, value: value);
    return writingData;
  }

  Future readSecureData(String key) async {
    var readingData = await _storage.read(key: key);
    return readingData;
  }

  Future deleteSecureData(String key) async {
    var deleteData = await _storage.delete(key: key);
    return deleteData;
  }
}
