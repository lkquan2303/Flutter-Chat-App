// ignore: import_of_legacy_library_into_null_safe
import 'package:encrypt/encrypt.dart';

import 'encryption_service_contract.dart';

class EncryptionService implements IEncryption {
  final Encrypter _encrypter;
  final _iv = IV.fromLength(16);

  // ignore: sort_constructors_first
  EncryptionService(this._encrypter);

  @override
  String decrypt(String encryptedText) {
    final encrypted = Encrypted.fromBase64(encryptedText);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }

  @override
  String encrypt(String text) {
    return _encrypter.encrypt(text, iv: _iv).base64;
  }
}
