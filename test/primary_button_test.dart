import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tripavail/widgets/primary_button.dart';
import 'package:tripavail/utils/theme/app_light_theme.dart';
import 'package:tripavail/utils/theme/app_dark_theme.dart';

void main() {
  group('PrimaryButton', () {
    testWidgets('uses colorScheme.primary and onPrimary when enabled', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: lightTheme,
        home: Scaffold(
          body: PrimaryButton(title: 'Go', onPressed: () {}),
        ),
      ));

      final inkFinder = find.byType(PrimaryButton);
      expect(inkFinder, findsOneWidget);
      // Render and settle to ensure paint
      await tester.pumpAndSettle();
      // We can’t directly read gradient/paint, but we can assert text color.
      final text = tester.widget<Text>(find.text('Go'));
      final onPrimary = lightTheme.colorScheme.onPrimary;
      expect((text.style?.color), onPrimary);
    });

    testWidgets('uses primaryContainer + onPrimaryContainer when disabled', (tester) async {
      await tester.pumpWidget(MaterialApp(
        theme: darkTheme,
        home: Scaffold(
          body: PrimaryButton(title: 'Go', onPressed: () {}, enabled: false),
        ),
      ));
      await tester.pumpAndSettle();
      final text = tester.widget<Text>(find.text('Go'));
      final onPrimaryContainer = darkTheme.colorScheme.onPrimaryContainer;
      expect(text.style?.color, onPrimaryContainer);
    });
  });
}
