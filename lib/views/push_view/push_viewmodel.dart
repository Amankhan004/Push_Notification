import 'dart:convert';

import 'package:push_notification/services/notification_services.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class PushViewModel extends BaseViewModel {
  NotificationServices notificationServices = NotificationServices();

  void requestNotificationPermission() {
    notificationServices.requestNotificationPermission();
  }

  void getToken() {
    notificationServices
        .getToken()
        .then((value) => {print('Device Token'), print(value)});
  }

  void firebaseInit(context) {
    notificationServices.firebaseInit(context);
  }

 void setupInteraction(context) {
    notificationServices.setupInteractMessage(context);
  }

void  postApi() {
    notificationServices.getToken().then((value) async {
      var data = {
        'to': value.toString(),
        'priority': 'high',
        'notification': {
          'title': 'Test by FCM API',
          'body': 'This is a very long notification message by ME&quot',
        },
        'data': {'type': 'aman', 'id': '1234'}
      };

      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          body: jsonEncode(data),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'key=your server key'});

          
    });

  
  }
}
