import 'package:chat_module/src/services/encryption/encryption_service_contract.dart';
import 'package:chat_module/src/services/encryption/encryption_service_impl.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:encrypt/encrypt.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  IEncryption? sut;

  setUp(() {
    final encrypter = Encrypter(AES(Key.fromLength(32)));
    sut = EncryptionService(encrypter);
  });

  test('it encrypts plain text', () {
    const text = 'this is text';
    final base64 = RegExp(
        r'^(?:[A-Za-z0-9+\/]{4})*(?:[A-Za-z0-9+\/]{2}==|[A-Za-z0-9+\/]{3}=|[A-Za-z0-9+\/]{4})$');
    final encrypted = sut!.encrypt(text);

    expect(base64.hasMatch(encrypted), true);
  });
  test('it decrypts the encryted text', () {
    const text = 'This is a message';
    final encrypted = sut?.encrypt(text);
    final decrypted = sut?.decrypt(encrypted!);

    expect(decrypted, text);
  });
}
