import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('BMI Calculator Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(BMICalculator());

    expect(find.text('BMI CALCULATOR'), findsOneWidget);

    expect(find.byIcon(Icons.add), findsNothing);
  });
}
