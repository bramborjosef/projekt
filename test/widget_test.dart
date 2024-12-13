import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('Test přihlášení', (WidgetTester tester) async {
    // Build our app a trigger a frame.
    await tester.pumpWidget(MyApp());

    // Zkontroluj, že na obrazovce jsou pole pro uživatelské jméno a heslo
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.text('Uživatelské jméno'), findsOneWidget);
    expect(find.text('Heslo'), findsOneWidget);

    // Zkontroluj, že chybová zpráva není zobrazená
    expect(find.text('Přihlašovací údaje jsou špatně zadány!'), findsNothing);

    // Zadej nesprávné údaje
    await tester.enterText(find.byType(TextField).at(0), 'wronguser');
    await tester.enterText(find.byType(TextField).at(1), 'wrongpassword');

    // Klikni na tlačítko přihlásit
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Ověř, že se zobrazí chybová zpráva
    expect(find.text('Přihlašovací údaje jsou špatně zadány!'), findsOneWidget);
  });
}
