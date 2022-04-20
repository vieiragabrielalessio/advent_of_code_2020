// https://adventofcode.com/2020/day/6

import 'dart:io';

main() async {
  final String path = 'lib/day06/input.txt';
  final List<String> lines = await File(path).readAsLines();

  solvePart1(lines);
  solvePart2(lines);
}

void solvePart1(List<String> lines) {
  final List<String> groupQuestions = [];
  int totalQuestions = 0;

  for (String line in lines) {
    if (line.isEmpty) {
      totalQuestions += groupQuestions.length;
      groupQuestions.clear();
      continue;
    }

    for (int i = 0; i < line.length; i++) {
      final String question = line[i];

      if (!groupQuestions.contains(question)) {
        groupQuestions.add(question);
      }
    }
  }

  // handle last group
  totalQuestions += groupQuestions.length;

  print('part 1: $totalQuestions');
}

void solvePart2(List<String> lines) {
  final Map<String, int> groupQuestions = {};
  int groupMembersCount = 0;
  int totalQuestions = 0;

  for (String line in lines) {
    if (line.isEmpty) {
      totalQuestions += groupQuestions.values
          .where((questionCount) => questionCount == groupMembersCount)
          .length;
      groupQuestions.clear();
      groupMembersCount = 0;
      continue;
    }

    groupMembersCount++;

    for (int i = 0; i < line.length; i++) {
      final String question = line[i];

      if (groupQuestions[question] == null) {
        groupQuestions[question] = 1;
      } else {
        groupQuestions[question] = groupQuestions[question]! + 1;
      }
    }
  }

  // handle last group
  totalQuestions += groupQuestions.values
      .where((questionCount) => questionCount == groupMembersCount)
      .length;

  print('part 2: $totalQuestions'); // < 3523
}
