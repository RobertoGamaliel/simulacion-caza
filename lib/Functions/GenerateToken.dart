import 'dart:math';

class GenerateToken {
  static String GenToken() {
    String letters =
        "0123456789abcdefghijklmnopqrstuvwxyz!@#%^&*()ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    String token = "";
    int len = letters.length;
    for (var i = 0; i < 35; i++) {
      int index = Random().nextInt(len);
      token += letters.substring(index, index + 1);
    }
    return token;
  }
}
