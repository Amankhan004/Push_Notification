import 'package:flutter/material.dart';
import 'package:push_notification/views/message_view/message_viewModel.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  final String id;
  MessageView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => MessageViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Notification ID" + id),
            ),
          );
        });
  }
}
