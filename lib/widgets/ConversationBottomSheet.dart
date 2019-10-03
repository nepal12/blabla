import 'package:flutter/material.dart';
import 'package:blabla/config/Styles.dart';
import 'package:blabla/widgets/ConversationListWidget.dart';

import 'package:blabla/widgets/NavigationPillWidget.dart';

class ConversationBottomSheet extends StatefulWidget {
  @override
  _ConversationBottomSheetState createState() =>
      _ConversationBottomSheetState();

  const ConversationBottomSheet();
}

class _ConversationBottomSheetState extends State<ConversationBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: <Widget>[
              GestureDetector(
                child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      NavigationPillWidget(),
                      Center(
                          child: Text('Messages', style: Styles.textHeading)),
                      SizedBox(
                        height: 20,
                      ),
                    ]),
                onVerticalDragEnd: (details) {
                  if (details.primaryVelocity > 50) {
                    Navigator.pop(context);
                  }
                },
              ),
              ConversationListWidget(),
            ])));
  }
}
