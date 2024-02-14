import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import '../pages/home_page.dart';

class InitialStateOfApp extends GivenWithWorld<FlutterWorld> {
  InitialStateOfApp()
      : super(StepDefinitionConfiguration()..timeout = const Duration(seconds: 30));

  @override
  Future<void> executeStep() async {
    HomePage homePage = HomePage(world.driver);
  }

  @override
  RegExp get pattern => RegExp(r"I test the initial state of the app");
}
