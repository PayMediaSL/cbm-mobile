// import 'dart:convert';

// import 'package:flutter_encryption_plugin/flutter_encryption_plugin.dart';
// import 'package:crypto/crypto.dart';

// class CryptoUtil {
//   CryptoUtil._();

//   static String createSha256Hash(String plainText) {
//     final bytes = utf8.encode(plainText);
//     final digest = sha256.convert(bytes);

//     return digest.toString();
//   }

//   static Future<String> generateAesKey() async =>
//       await FlutterEncryptionPlugin.getAESKey();

//   static Future<String> decryptWithAesKey(
//           String encryptedText, String password) async =>
//       await FlutterEncryptionPlugin.decryptAES(encryptedText, password);

//   static String encodeToBase64(String text) {
//     Codec<String, String> stringToBase64 = utf8.fuse(base64);
//     final encoded = stringToBase64.encode(text);

//     return encoded;
//   }

//   static String decodeBase64(String base64EncodedText) {
//     Codec<String, String> stringToBase64 = utf8.fuse(base64);
//     final decoded = stringToBase64.decode(base64EncodedText);

//     return decoded;
//   }
// }
