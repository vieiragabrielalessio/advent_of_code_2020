// https://adventofcode.com/2020/day/2

import 'dart:io';

main() async {
  final String path = 'lib/day02/input.txt';
  final List<String> lines = await File(path).readAsLines();

  solvePart1(lines);
  solvePart2(lines);
}

void solvePart1(List<String> lines) {
  int validPasswords = 0;
  for (String line in lines) {
    final List<String> elements = line.split(' ');
    final int atLeast = int.parse(elements.first.split('-').first);
    final int atMost = int.parse(elements.first.split('-').last);
    final String letter = elements[1].replaceAll(':', '');
    final String password = elements.last;

    final int totalMatches = letter.allMatches(password).length;

    if (totalMatches >= atLeast && totalMatches <= atMost) {
      validPasswords++;
    }
  }
  print('part 1: $validPasswords');
}

void solvePart2(List<String> lines) {
  int validPasswords = 0;
  for (String line in lines) {
    final List<String> elements = line.split(' ');
    final int firstIndex = int.parse(elements.first.split('-').first) - 1;
    final int secondIndex = int.parse(elements.first.split('-').last) - 1;
    final String letter = elements[1].replaceAll(':', '');
    final String password = elements.last;

    if ((password[firstIndex] == letter && password[secondIndex] != letter) ||
        (password[firstIndex] != letter && password[secondIndex] == letter)) {
      validPasswords++;
    }
  }
  print('part 2: $validPasswords');
}
