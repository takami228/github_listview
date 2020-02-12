import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter Navigation Test', () {
    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('is contains OVERFLOWING', () async {
      RenderTree tree = await driver.getRenderTree();
      Map<String, dynamic> map = tree.toJson();
      expect(map['tree'].toString().contains('OVERFLOWING'), false);
    });
  });
}
