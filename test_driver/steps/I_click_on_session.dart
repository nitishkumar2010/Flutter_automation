import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';
import '../pages/home_page.dart';

class ClickSession extends GivenWithWorld<FlutterWorld> {
  ClickSession()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 60));

  @override
  Future<void> executeStep() async {
    HomePage homePage = HomePage(world.driver);
    await homePage.clickSessionButton();
    await Future.delayed(const Duration(seconds: 10), () {});
  }

  @override
  RegExp get pattern => RegExp(r"I tap the Icon Sessions button");
}
