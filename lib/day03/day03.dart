// https://adventofcode.com/2020/day/3

import 'dart:io';

main() async {
  final String path = 'lib/day03/input.txt';
  final List<String> lines = await File(path).readAsLines();

  solvePart1(lines);
  solvePart2(lines);
}

int _calculateTrees(List<String> lines, int rightStep, [int downStep = 1]) {
  int x = 0; // x coordinate
  int trees = 0;

  for (int y = 0; y < lines.length; y += downStep) {
    if (lines[y][x] == '#') {
      trees++;
    }
    x += rightStep;
    if (x >= lines[y].length) {
      x = x - lines[y].length;
    }
  }
  return trees;
}

void solvePart1(List<String> lines) {
  final int result = _calculateTrees(lines, 3);
  print('part 1: $result');
}

void solvePart2(List<String> lines) {
  final int result = _calculateTrees(lines, 1) *
      _calculateTrees(lines, 3) *
      _calculateTrees(lines, 5) *
      _calculateTrees(lines, 7) *
      _calculateTrees(lines, 1, 2);
  print('part 2: $result');
}
