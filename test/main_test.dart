import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/main.dart';
import 'package:blabla/pages/ConversationPageList.dart';

void main() {
  testWidgets('Main UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(Blabla());

    expect(find.byType(ConversationPageList),findsOneWidget);

  });
}