import 'dart:io';

import 'package:tic_tac_toe/gameloop.dart' as gameloop;

void main(List<String> arguments) {
  while (true) {
    gameloop.gameloop();
    stdout.write('Restart (1.Yes Other.No)? ');
    var election = int.parse(stdin.readLineSync());
    switch (election) {
      case 1:
        continue;
        break;

      default:
        break;
    }
    break;
  }
}
