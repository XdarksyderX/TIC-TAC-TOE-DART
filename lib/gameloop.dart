import 'dart:io';

import 'grid.dart' as grid;

import 'dart:math' as math;

void dataEnter(grid.Grid grid) {
  var row, col;
  while (true) {
    stdout.write('Enter the row: ');
    row = int.parse(stdin.readLineSync());

    stdout.write('Enter the col: ');
    col = int.parse(stdin.readLineSync());
    if (grid.getGridInfo[row - 1][col - 1] == '*') {
      try {
        grid.assingCell(row - 1, col - 1, 'X');
        break;
      } catch (err) {}
    }
    grid.printGrid();
    print('Enter a valid position\n');
  }
}

void gameloop() {
  stdout.write('Enter the grid number: ');
  var gridNumber = int.parse(stdin.readLineSync());

  while (gridNumber <= 1) {
    print('Enter a grid number higher than one: ');
    gridNumber = int.parse(stdin.readLineSync());
  }

  var mainGrid = grid.Grid(gridNumber);
  while (true) {
    var gridInfo = mainGrid.getGridInfo;
    mainGrid.printGrid();
    dataEnter(mainGrid);
    var random = math.Random();
    var randomRow = random.nextInt(gridNumber);
    var randomCol = random.nextInt(gridNumber);

    while (gridInfo[randomRow][randomCol] != '*') {
      randomRow = random.nextInt(gridNumber);
      randomCol = random.nextInt(gridNumber);
    }
    mainGrid.assingCell(randomRow, randomCol, 'O');
    if (mainGrid.checkGlobal('X')) {
      print('YOU WIN!!!!!!');
      mainGrid.printGrid();
      break;
    } else if (mainGrid.checkGlobal('O')) {
      print('YOU LOSE!!!!');
      mainGrid.printGrid();
      break;
    }
  }
}

void main(List<String> args) {
  gameloop();
}
