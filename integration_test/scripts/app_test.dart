import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../common/test_case.dart';

class SampleTest implements TestCase {
  @override
  execute(WidgetTester tester) async {
    await _login(tester);
  }

  _login(WidgetTester tester) async {
    expect(find.byKey(const ValueKey('Heading Fitness Application')), findsOneWidget);
    if (kDebugMode) {
      print("Found one widget with ValueKey as 'Heading Fitness Application'");
    }
    // Finds the sessions icon button to tap on.
    final fab = find.byKey(const ValueKey('Icon Sessions'));

    // Emulate a tap on the sessions icon.
    await tester.tap(fab);

    // Trigger a frame.
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('Button to add new session')), findsOneWidget);
    if (kDebugMode) {
      print("Found one widget with ValueKey as 'Button to add new session'");
    }

    await _addNewSession(tester);
  }

  _addNewSession(WidgetTester tester) async {
    final addNewSession = find.byKey(const ValueKey('Button to add new session'));
    await tester.tap(addNewSession);

    await tester.pumpAndSettle(const Duration(seconds: 15));

    expect(find.byKey(const ValueKey('Text Insert Training session')), findsOneWidget);
    expect(find.byKey(const ValueKey('TextField with HintText Description')), findsOneWidget);
    expect(find.byKey(const ValueKey('TextField with HintText Duration')), findsOneWidget);
    expect(find.byKey(const ValueKey('ElevatedButton Save')), findsOneWidget);

    if (kDebugMode) {
      print("Found one widget for all the 4 widgets");
    }

    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('TextField with HintText Description')));
    await tester.enterText(find.byType(TextField).at(0), 'Walk');
    await Future.delayed(const Duration(seconds: 3), () {});

    final textField1 = find.byType(TextField).evaluate().elementAt(0).widget as TextField;
    expect(textField1.controller!.text, equals("Walk"));
    if (kDebugMode) {
      print(textField1);
      print(textField1.controller!.selection);
      print(textField1.controller!.value);
      print(textField1.decoration!.hintText);
    }

    await tester.tap(find.byKey(const ValueKey('TextField with HintText Duration')));
    await tester.enterText(find.byType(TextField).at(1), '20');
    await Future.delayed(const Duration(seconds: 3), () {});

    final textField2 = find.byType(TextField).evaluate().elementAt(1).widget as TextField;
    expect(textField2.controller!.text, equals("20"));
    if (kDebugMode) {
      print(textField2);
      print(textField2.controller!.selection);
      print(textField2.controller!.value);
      print(textField1.decoration!.hintText);
    }
    
    await tester.tap(find.byKey(const ValueKey('ElevatedButton Save')).first);
    await tester.pumpAndSettle();

  }
}
