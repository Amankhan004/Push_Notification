
import 'package:flutter/material.dart';
import 'package:push_notification/services/notification_services.dart';
import 'package:push_notification/views/push_view/push_viewmodel.dart';
import 'package:stacked/stacked.dart';

// ignore: must_be_immutable
class PushNotification extends StatelessWidget {
  PushNotification({super.key});
  NotificationServices notificationServices = NotificationServices();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        onViewModelReady: (viewModel) => {
              viewModel.requestNotificationPermission(),
              viewModel.setupInteraction(context),
              viewModel.getToken(),
              viewModel.firebaseInit(context)
            },
        viewModelBuilder: () => PushViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Flutter Notification"),
            ),
            body: Center(
              child: TextButton(
                  onPressed: () {
                    viewModel.postApi();
                  },
                  child: const Text("Send Notification")),
            ),
          );
        });
  }
}
