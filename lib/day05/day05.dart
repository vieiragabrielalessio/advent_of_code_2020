// https://adventofcode.com/2020/day/5

import 'dart:io';

main() async {
  final String path = 'lib/day05/input.txt';
  final List<String> lines = await File(path).readAsLines();

  solvePart1(lines);
  solvePart2(lines);
}

void solvePart1(List<String> lines) {
  int highestSeatId = 0;

  for (String line in lines) {
    // find row
    List<int> rows = List.generate(128, (index) => index);
    for (int i = 0; i < 7; i++) {
      if (line[i] == 'F') {
        rows = rows.sublist(0, (rows.length / 2).floor());
      } else {
        rows = rows.sublist((rows.length / 2).floor(), rows.length);
      }
    }

    // find column
    List<int> columns = List.generate(8, (index) => index);

    for (int i = 7; i < line.length; i++) {
      if (line[i] == 'L') {
        columns = columns.sublist(0, (columns.length / 2).floor());
      } else {
        columns = columns.sublist((columns.length / 2).floor(), columns.length);
      }
    }

    final int row = rows.single;
    final int column = columns.single;

    final int seatId = (row * 8) + column;

    if (seatId > highestSeatId) {
      highestSeatId = seatId;
    }
  }

  print('part 1: $highestSeatId');
}

void solvePart2(List<String> lines) {
  final List<int> seatIds = <int>[];

  for (String line in lines) {
    // find row
    List<int> rows = List.generate(128, (index) => index);
    for (int i = 0; i < 7; i++) {
      if (line[i] == 'F') {
        rows = rows.sublist(0, (rows.length / 2).floor());
      } else {
        rows = rows.sublist((rows.length / 2).floor(), rows.length);
      }
    }

    // find column
    List<int> columns = List.generate(8, (index) => index);
    for (int i = 7; i < line.length; i++) {
      if (line[i] == 'L') {
        columns = columns.sublist(0, (columns.length / 2).floor());
      } else {
        columns = columns.sublist((columns.length / 2).floor(), columns.length);
      }
    }

    final int row = rows.single;
    final int column = columns.single;

    final int seatId = (row * 8) + column;

    seatIds.add(seatId);
  }

  // get the first number that does not have one that follows it
  final int mySeatId =
      seatIds.firstWhere((id) => !seatIds.contains(id + 1)) + 1;

  print('part 2: $mySeatId');
}
