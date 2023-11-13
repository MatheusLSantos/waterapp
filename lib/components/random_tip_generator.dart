import 'dart:math';

class RandomTipGenerator {
  static List<String> _texts = [
    'Texto 1',
    'Texto 2',
    'Texto 3',
    'Texto 4',
    'Texto 5',
  ];

  static String getRandomTip() {
    final random = Random();
    final index = random.nextInt(_texts.length);
    return _texts[index];
  }
}
