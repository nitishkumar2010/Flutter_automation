import 'package:flutter_driver/flutter_driver.dart';

class HomePage {
  final sessionButton = find.byValueKey('Icon Sessions');
  final adDButton = find.byValueKey('Add Icon');
  // final btnAdd = find.byValueKey("add");
  // final btnSubtract = find.byValueKey("subtract");
  // final txtAlert = find.byValueKey("alert_text");
  // final btnClose = find.byValueKey("close_button");

  FlutterDriver? driver;
  HomePage(FlutterDriver? driver) {
    this.driver = driver;
  }

  // Future<FlutterDriver> setupAndGetDriver() async {
  //   FlutterDriver driver = await FlutterDriver.connect();
  //   var connected = false;
  //   while (!connected) {
  //     try {
  //       await driver.waitUntilFirstFrameRasterized();
  //       connected = true;
  //     } catch (error) {}
  //   }
  //   return driver;
  // }

  // Future<String> getCounterValue() async {
  //   return await driver!.getText(txtCounter);
  // }

  // Future<void> clickBtnPlus() async {
  //   return await driver!.tap(btnIncrement);
  // }

  // Future<void> clickSubtractButton() async {
  //   return driver!.tap(btnSubtract);
  // }

  Future<void> clickAddButton() async {
    return driver!.tap(adDButton);
  }

  Future<void> clickSessionButton() async {
    return driver!.tap(sessionButton);
  }

  Future<void> teardown() async {
    driver!.close();
  }
}
