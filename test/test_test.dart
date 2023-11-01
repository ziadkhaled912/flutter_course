import 'package:flutter_test/flutter_test.dart';


void main() {

  test("modules Test", () {
    int index = 2;
    int length = 3;
    index = (index % (length-1)).toInt();
    print("$index");
  });
}