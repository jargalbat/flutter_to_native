import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:pointycastle/export.dart';

class Crypto {
  static const String _KEY_SET = "1234567890zxcvbnmlkjhgfdsaqwertyuiop";

  static String keyGen() {
    String key = "";

    Random rnd = Random();
    for (int i = 0; i < 16; i++) {
      int index = rnd.nextInt(_KEY_SET.length - 1);
      String c = _KEY_SET[index];
      key += c;
    }

    return key;
  }

  static String makeSD(String data, String key) {
    return encryptAES(data, key);
  }

  static String makeEk(String key) {
    return encryptRSA(key);
  }

  static String makeSg(String data) {
    Uint8List hash = sha1hash(createUint8ListFromString(data));
    return base64.encode(hash);
  }

  static Map<String, dynamic> encryptData(Map<String, dynamic> dataSecure) {
    ///
    /// secure fields map to json string
    ///
    String dataJson = json.encode(dataSecure);

    ///
    /// key generate
    ///
    String key = keyGen();

    ///
    /// new map and add encrypt secure json string fields
    ///
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SD'] = makeSD(dataJson, key);
    data['EK'] = makeEk(key);
    data['SG'] = makeSg(dataJson);

    return data;
  }

  ///
  /// AMPAG-д зориулсан нууцлалын алгоритмуудын класс
  ///

  ///
  /// RSA нууцлал хийхэд ашиглаж байгаа нийтийн түлхүүр
  ///
  static String publicKey = "-----BEGIN PUBLIC KEY-----\n" +
      "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCfQZP2zMuQaXpJPfj2+qIypedg\n" +
      "6/RLrgUqa15xgXHO0MfLz1toR7ME21594cYsq0UJZ6GyEuip38KVhvTOb8DYmFvF\n" +
      "zr6cd4kLDeMuyH2omyDKDaphxNjFQQDdQI4jPS4e7oFEH5lCkBICfWM3U4UBB4/c\n" +
      "JogTLb5DFZkco8eQ0QIDAQAB\n" +
      "-----END PUBLIC KEY-----";

  // RSA нууцлал хийхэд ашиглаж байгаа нийтийн түлхүүр - дээрхтэй publicKey -тэй адил !!!
  //String modulusString = "n0GT9szLkGl6ST349vqiMqXnYOv0S64FKmtecYFxztDHy89baEezBNtefeHGLKtFCWehshLoqd/ClYb0zm/A2Jhbxc6" +
  //                    "+nHeJCw3jLsh9qJsgyg2qYcTYxUEA3UCOIz0uHu6BRB+ZQpASAn1jN1OFAQeP3CaIEy2+QxWZHKPHkNE=";
  //String publicExponentString = "AQAB";

  ///
  /// AES-CBC-128 algorithm - old name is 'encrypt1'
  ///
  static String encryptAES(String data, String password) {
    Uint8List derivedKey = createUint8ListFromString(password);
    Uint8List iv = Uint8List.fromList([
      0xA1,
      0xE2,
      0xD5,
      0xFE,
      0xDA,
      0x52,
      0x0A,
      0x8F,
      0x8A,
      0x19,
      0xAA,
      0xBB,
      0x0A,
      0xD0,
      0x55,
      0xAC
    ]);
    Uint8List plainText = Uint8List.fromList(utf8.encode(data));

    PaddedBlockCipher cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESFastEngine()),
    );

    cipher.init(
      true,
      PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
        ParametersWithIV<KeyParameter>(KeyParameter(derivedKey), iv),
        null,
      ),
    );
    Uint8List cipherText = cipher.process(plainText);

    return base64.encode(cipherText);
  }

  ///
  /// RSA - old name is 'encrypt2'
  ///
  static String encryptRSA(String data) {
    var parser = RSAKeyParser();
    RSAPublicKey pubKey = parser.parse(publicKey);

    var encrypter = Encrypter(RSA(publicKey: pubKey, privateKey: null));
    var encrypted = encrypter.encrypt(data);

    return encrypted.base64;
  }

  ///
  /// AES-128 гэхдээ логин үйлдэлд зориулаад өөрөөр хийсэн байна - old name is 'crypt'
  ///
  static String encryptForLogin(String data) {
    Uint8List buffer = createUint8ListFromString(data);
    Uint8List pData = sha1hash(buffer);

    Uint8List secretKey = new Uint8List(16);
    Uint8List victoryKey = new Uint8List(16);
    for (int i = 0; i < 16; i++) {
      secretKey[i] = pData[i];
    }
    for (int i = 0; i < 16; i++) {
      victoryKey[i] = pData[pData.lengthInBytes - i - 1];
    }
    PaddedBlockCipher cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESFastEngine()),
    );

    cipher.init(
      true,
      PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
        ParametersWithIV<KeyParameter>(KeyParameter(secretKey), victoryKey),
        null,
      ),
    );
    Uint8List encrypted = cipher.process(pData);

    return getHex(encrypted);
  }

  static Uint8List encryptForReset(Uint8List pData, Uint8List key) {
    Uint8List secretKey = new Uint8List(16);
    Uint8List victoryKey = new Uint8List(16);
    for (int i = 0; i < 16; i++) {
      secretKey[i] = key[i];
    }
    for (int i = 0; i < 16; i++) {
      victoryKey[i] = key[key.lengthInBytes - i - 1];
    }
    PaddedBlockCipher cipher = PaddedBlockCipherImpl(
      PKCS7Padding(),
      CBCBlockCipher(AESFastEngine()),
    );

    cipher.init(
      true,
      PaddedBlockCipherParameters<CipherParameters, CipherParameters>(
        ParametersWithIV<KeyParameter>(KeyParameter(secretKey), victoryKey),
        null,
      ),
    );
    Uint8List encrypted = cipher.process(pData);

    return encrypted;
  }

  static Uint8List sha1hash(Uint8List data) {
    Digest sha1 = new SHA1Digest();
    Uint8List out = new Uint8List(20);
    sha1.update(data, 0, data.lengthInBytes);
    sha1.doFinal(out, 0);
    return out;
  }

  static String getHex(Uint8List bytes) {
    var result = new StringBuffer();
    for (var i = 0; i < bytes.lengthInBytes; i++) {
      var part = bytes[i];
      result.write('${part < 16 ? '0' : ''}${part.toRadixString(16)}');
    }
    return result.toString();
  }
}

///
/// String -> Uint8List function
///
Uint8List createUint8ListFromString(String s) {
  var ret = new Uint8List(s.length);
  for (var i = 0; i < s.length; i++) {
    ret[i] = s.codeUnitAt(i);
  }
  return ret;
}

String generateTan(String counter) {
  /// Generate TAN code

  String result = "";
  try {
    Uint8List buffer = createUint8ListFromString('88989800');
    // ignore: non_constant_identifier_names
    Uint8List PIN = Crypto.sha1hash(buffer);

    Uint8List data = createUint8ListFromString(counter);

    Uint8List fullData = new Uint8List(PIN.length + data.length);

    for (var i = 0; i < PIN.length; i++) {
      fullData[i] = PIN[i];
    }

    for (var i = 0; i < data.length; i++) {
      fullData[PIN.length + i] = data[i];
    }

    Uint8List res = Crypto.sha1hash(fullData);

    int offset1 = res[res.length - 1] & 0xf;
    int offset2 = res[res.length - 10] & 0xf;
    int bytes1 = (res[offset1] & 0x7f) << 8 | (res[offset1 + 1] & 0xff);
    int bytes2 = (res[offset2] & 0x7F) << 8 | (res[offset2 + 1] & 0xff);

    String res1 = (bytes1 % 1000).toString();
    String res2 = (bytes2 % 1000).toString();
    int tmpLen1 = res1.length;
    int tmpLen2 = res2.length;
    int len = 3;

    for (int i = 0; i < (len - tmpLen1); i++) {
      res1 = "0" + res1;
    }
    for (int i = 0; i < (len - tmpLen2); i++) {
      res2 = "0" + res2;
    }

    result = (res1 + res2).substring(0, 2) +
        " " +
        (res1 + res2).substring(2, 4) +
        " " +
        (res1 + res2).substring(4);
  } catch (e) {
    print(e);
  }

  return result;
}
