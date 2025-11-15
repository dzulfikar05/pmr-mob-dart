import 'package:encrypt/encrypt.dart';

class CryptoService {
  static final key = Key.fromUtf8('32characterslongsecretkey123456');
  static final iv = IV.fromLength(16);
  static final aes = Encrypter(AES(key));

  static String encrypt(String text) {
    return aes.encrypt(text, iv: iv).base64;
  }

  static String decrypt(String encrypted) {
    return aes.decrypt64(encrypted, iv: iv);
  }
}
