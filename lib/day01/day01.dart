// https://adventofcode.com/2020/day/1

import 'dart:io';

main() async {
  final String path = 'lib/day01/input.txt';
  final List<String> lines = await File(path).readAsLines();

  solvePart1(lines);
  solvePart2(lines);
}

void solvePart1(List<String> lines) {
  final List<int> numbers = lines.map(int.parse).toList();

  for (int number in numbers) {
    final int numberToFind = 2020 - number;
    if (numbers.contains(numberToFind)) {
      print('part 1: ${number * numberToFind}');
      return;
    }
  }
}

void solvePart2(List<String> lines) {
  final List<int> numbers = lines.map(int.parse).toList();

  for (int firstNumber in numbers) {
    final int sumToFind = 2020 - firstNumber;
    for (int secondNumber in numbers) {
      final int thirdNumber = sumToFind - secondNumber;
      if (numbers.contains(thirdNumber)) {
        print('part 2: ${firstNumber * secondNumber * thirdNumber}');
        return;
      }
    }
  }
}
