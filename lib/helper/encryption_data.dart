import 'package:encrypt/encrypt.dart';

class EncryptData {
  static final _key = Key.fromUtf8(
      'this.is.my.key.for.secret.data..'); // Generate a 256-bit key
  static final _iv = IV.fromLength(16); // Generate a 128-bit I

  static final _encrypter = Encrypter(AES(
    _key,
  ));
  static String encryptMessage(String text) {
    final encrypted = _encrypter.encrypt(text, iv: _iv);
    return encrypted.base64;
  }

  static dynamic decryptMessage(String text) {
    final encData = Encrypted.from64(text);
    final decrypted = _encrypter.decrypt(encData, iv: _iv);
    return decrypted;
  }

  static void printEncData() {
    print(_key.base64);
    print(_iv.base64);

  }
}
