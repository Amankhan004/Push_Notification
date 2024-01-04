import 'package:flutter/material.dart';
import 'package:push_notification/views/push_view/push_viewmodel.dart';
import 'package:stacked/stacked.dart';

class PushNotification extends StatelessWidget {
  PushNotification({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PushViewModel>.reactive(
      viewModelBuilder: () => PushViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.requestNotificationPermission();
        viewModel.setupInteraction(context);
        viewModel.getToken();
        viewModel.firebaseInit(context);
        // viewModel.postApi(); // Call postApi to fetch notification data
      },
      builder: (context, viewModel, child) {
        // Check if notification data is available
        if (viewModel.sentNotificationData != null) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Notification"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      viewModel.postApi();
                    },
                    child: const Text("Send Notification"),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.sentNotificationData!.length,
                      itemBuilder: (context, index) {
                        final data = viewModel.sentNotificationData![index];
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            title: Text(data['title'] ?? ''),
                            subtitle: Text(data['body'] ?? ''),
                            leading: data['imageUrl'] != null
                                ? Image.network(data['imageUrl']!)
                                : null,
                            // Customize the display of other fields as needed
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Handle the case when notification data is not available yet
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Notification"),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  viewModel.postApi();
                },
                child: const Text("Send Notification"),
              ),
            ),
          );
        }
      },
    );
  }
}
