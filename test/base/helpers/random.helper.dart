import 'dart:math';

class RandomHelper {
  Random random = Random();

  DateTime generateRandomDateTime({DateTime? min, DateTime? max}) {
    min ??= DateTime(2000);
    max ??= DateTime(2099);
    var timeStamp = generateRandomDouble(
            (min.millisecondsSinceEpoch).toDouble(),
            (max.millisecondsSinceEpoch).toDouble())
        .floor();

    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  int generateRandomInt(int? min, int? max) {
    min ??= 0;
    max ??= 1000000000;
    return random.nextInt(max - min) + min;
  }

  double generateRandomDouble(double? min, double? max) {
    min ??= 0;
    max ??= 1000000000;

    return random.nextDouble() * (max - min) + min;
  }

  String generateRandomString(int length) {
    var chars = 'abcdefghijklmnopqrstuvwxyz';
    var str = '';
    for (var i = 0; i < length; i++) {
      str += chars[generateRandomInt(0, chars.length)];
    }
    return str;
  }
}
