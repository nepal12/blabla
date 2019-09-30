import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:blabla/pages/ConversationPage.dart';
import 'package:blabla/pages/ConversationPageSlide.dart';
import 'package:blabla/widgets/InputWidget.dart';

void main(){
  const MaterialApp app = MaterialApp(
    home: Scaffold(
        body:  const ConversationPageSlide()
    ),
  );
  testWidgets('ConversationPageSlide UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(app);
    expect(find.byType(ConversationPage),findsOneWidget);
    expect(find.byType(PageView),findsOneWidget);
    expect(find.byType(InputWidget),findsOneWidget);

  });
}