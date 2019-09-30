import 'package:blabla/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:blabla/main.dart';

void main() {
  testWidgets('Checking if hello world shows up', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Blabla());
    expect(find.text('Hello World!'), findsOneWidget);
  });
}