import 'dart:convert';

import 'package:push_notification/services/notification_services.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';



class ApiClient{

  NotificationServices notificationServices = NotificationServices();
   List<Map<String, dynamic>>? sentNotificationData; 


   Future<void> postApi() async{
    notificationServices.getDeviceToken().then((value) async {
      var uuid = Uuid();
      var randomId1 = uuid.v4();
      print("this is the randomid1" + randomId1);
      var randomId2 = uuid.v4();
      var data = {
        'to': value.toString(),
        'priority': 'high',
        'notification': {
          'title': 'Test by FCM API',
          'body': 'This is a very long notification message by ME&quot',
          'image':
              'https://tse2.mm.bing.net/th?id=OIP.7Ivk5LunRRZ7Ie3tpGcFNQHaIA&pid=Api&P=0&h=220'
        },
        'data': [
          {
            'type': 'type1',
            'id': randomId1,
            'title': 'Notification Title for Type 1',
            'body': 'Notification Body for Type 1',
            'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.7Ivk5LunRRZ7Ie3tpGcFNQHaIA&pid=Api&P=0&h=220',
            'customField': 'Custom field for Type 1',
          },
          {
            'type': 'type2',
            'id': randomId2,
            'title': 'Notification Title for Type 2',
            'body': 'Notification Body for Type 2',
            'imageUrl': 'https://tse2.mm.bing.net/th?id=OIP.7Ivk5LunRRZ7Ie3tpGcFNQHaIA&pid=Api&P=0&h=220',
            'customField': 'Custom field for Type 2',
          },
        ]
      };

      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization':
              'key=AAAANvwQn0s:APA91bGaDXaJx-dG4ZMH7I83NzNVzReuYhXfu7QSb5EkEHoFJxJ-QmdYXLCoREyTPXzxkGC4vXmuCjOpGbLP53IaoWB_ZCba3JXkxXetG40UELIC_fVnvuZ9dJQBGY3_7lRhNE8-XyiH'
        },
      );

      // Store the data in the class-level variable
      sentNotificationData = (data['data'] as List)
          .map((item) => item as Map<String, dynamic>)
          .toList();// Use null-aware operator
          // rebuildUi();
          await Future.delayed(Duration(seconds: 2));
           return;
       // Notify listeners of any changes
      // notifyListeners(); // Notify listeners of any changes
    });
  }
  
  


  
}