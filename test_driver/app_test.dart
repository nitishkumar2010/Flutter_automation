// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flutter driver test App', () {
    // First, define the Finders to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final iconSessionBtn = find.byValueKey("Icon Sessions");

    var dummy_data = "hello";
    FlutterDriver? driver;

    // Connect to the Flutter driver before testing.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests are completed.
    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test("check health", () async {
      Health health = await driver!.checkHealth();
      print(health.status);
    });

    test("flutter drive test", () async {
      await driver!.tap(iconSessionBtn);
      //await driver!.enterText(dummy_data);

      final addNewSession = find.byValueKey('Button to add new session');
      await driver!.tap(addNewSession);

      await driver!.tap(find.byValueKey('TextField with HintText Description'));
      await driver!.enterText("Walk");
      await Future.delayed(const Duration(seconds: 3), () {});

      await driver!.tap(find.byValueKey('TextField with HintText Duration'));
      await driver!.enterText("20");
      await Future.delayed(const Duration(seconds: 3), () {});

      await driver!.tap(find.byValueKey('ElevatedButton Save'));
    });
  });
}
