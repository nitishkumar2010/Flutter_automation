import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import 'steps/I_click_on_session.dart';

Future<void> main() {
  
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test_driver/features/**.feature")]
    // ..flutterBuildTimeout = Duration(seconds: 2)
    ..defaultTimeout = const Duration(seconds: 30)
    ..reporters = [
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json'),
      StdoutReporter()
    ]
    ..stepDefinitions = [
      //InitialStateOfApp(),
      //ClickPlus(),
      ClickSession()
    ]
    ..hooks = [AttachScreenshotOnFailedStepHook()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = "test_driver/bdd.dart";
  return GherkinRunner().execute(config);
}
