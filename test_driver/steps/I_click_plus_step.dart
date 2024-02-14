import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import '../pages/home_page.dart';

class ClickPlus extends AndWithWorld<FlutterWorld> {
  ClickPlus()
      : super(StepDefinitionConfiguration()
          ..timeout = const Duration(seconds: 30));

  @override
  Future<void> executeStep() async {
    HomePage homePage = HomePage(world.driver);
    await homePage.clickAddButton();
    await homePage.teardown();
  }

  @override
  RegExp get pattern => RegExp(r"I click on the plus button");
}
