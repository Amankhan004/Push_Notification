
import 'package:push_notification/views/message_view/message_view.dart';
import 'package:push_notification/views/push_view/push_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [

  MaterialRoute(page: PushNotification, initial: true),
  MaterialRoute(page: MessageView)
],

dependencies: [

  Singleton(classType: NavigationService)
])


class App{

}