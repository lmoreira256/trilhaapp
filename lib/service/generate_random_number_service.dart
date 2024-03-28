import 'dart:math';

class GenerateRandomNumberService {
  int generateRandonNumber(int maxNumber) {
    return Random().nextInt(maxNumber);
  }
}
