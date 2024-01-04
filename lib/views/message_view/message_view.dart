import 'package:flutter/material.dart';
import 'package:push_notification/views/message_view/message_viewModel.dart';
import 'package:stacked/stacked.dart';

class MessageView extends StatelessWidget {
  final String id;
  final String title;
  final String body;
  final String imageurl;
  final List<Map<String, dynamic>>? notificationData;

  MessageView({Key? key, required this.id, this.notificationData, required this.title, required this.body, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    print(notificationData);
    return ViewModelBuilder<MessageViewModel>.nonReactive(
      viewModelBuilder: () => MessageViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Notification ID: $id"),
          ),
          body: Center(
            child: Center(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(title),
                subtitle: Text(body),
                leading: imageurl.isNotEmpty
                    ? Image.network(imageurl)
                    : null,
                // Customize the display of other fields as needed
              ),
            ),
          ],
        ),
      ),
          ),
        );
      },
    );
  }
}
