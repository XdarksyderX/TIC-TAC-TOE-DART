import 'dart:io';
import 'gameloop.dart' as gameloop;

class Grid {
  int _gridNumber;
  List<List<String>> _gridInfo = [];
  Grid(int _gridNumber) {
    for (var row = 0; row < _gridNumber; row++) {
      _gridInfo.add([]);
    }

    for (var row = 0; row < _gridNumber; row++) {
      for (var col = 0; col < _gridNumber; col++) {
        _gridInfo[row].add('*');
      }
    }
  }

  List<List<String>> get getGridInfo {
    return _gridInfo;
  }

  int get getGridNumber {
    return _gridNumber;
  }

  void printGrid() {
    _gridInfo.forEach((row) {
      row.forEach((element) {
        stdout.write(element + '    ');
      });
      stdout.write('\n\n');
    });
  }

  bool checkHorizontal(String element) {
    var count = 0;
    for (var row = 0; row < _gridInfo.length; row++) {
      count = 0;
      for (var col = 0; col < _gridInfo[row].length; col++) {
        if (_gridInfo[row][col] != element) break;
        count++;
      }

      if (count == _gridInfo.length) return true;
    }
    return false;
  }

  bool checkVertical(String element) {
    var count = 0;
    for (var col = 0; col < _gridInfo.length; col++) {
      for (var row = 0; row < _gridInfo.length; row++) {
        if (_gridInfo[row][col] != element) break;
        count++;
      }
      if (count == _gridInfo.length) return true;
    }
    return false;
  }

  bool checkDiagonal(String element) {
    var count = 0;
    for (var row = 0, col = 0; col < _gridInfo.length; row++, col++) {
      if (_gridInfo[row][col] != element) break;
      count++;
      if (count == _gridInfo.length) return true;
    }
    count = 0;

    for (var row = 0, col = _gridInfo[row].length - 1;
        col < _gridInfo.length;
        row++, col--) {
      if (_gridInfo[row][col] != element) break;
      count++;
    }
    return count == _gridInfo.length;
  }

  bool checkGlobal(String element) {
    var allCheck = <bool>[
      checkDiagonal(element),
      checkHorizontal(element),
      checkVertical(element)
    ];
    for (var element = 0; element < allCheck.length; element++) {
      if (allCheck[element]) return true;
    }

    return false;
  }

  void assingCell(int row, int col, String element) {
    _gridInfo[row][col] = element;
  }

  void setGridInfo(List<List<String>> gridInfo) {
    _gridInfo = gridInfo;
  }
}

void main(List<String> args) {
  var miGrid = Grid(3);
  miGrid.setGridInfo([
    ['X', '*', '*'],
    ['O', 'X', 'O'],
    ['*', '*', 'X']
  ]);
  miGrid.printGrid();
  print(miGrid.checkDiagonal('X'));
}
