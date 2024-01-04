// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:push_notification/views/message_view/message_view.dart' as _i3;
import 'package:push_notification/views/push_view/push_view.dart' as _i2;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const pushNotification = '/';

  static const messageView = '/message-view';

  static const all = <String>{
    pushNotification,
    messageView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.pushNotification,
      page: _i2.PushNotification,
    ),
    _i1.RouteDef(
      Routes.messageView,
      page: _i3.MessageView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.PushNotification: (data) {
      final args = data.getArgs<PushNotificationArguments>(
        orElse: () => const PushNotificationArguments(),
      );
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.PushNotification(key: args.key),
        settings: data,
      );
    },
    _i3.MessageView: (data) {
      final args = data.getArgs<MessageViewArguments>(nullOk: false);
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.MessageView(
            key: args.key,
            id: args.id,
            notificationData: args.notificationData,
            title: args.title,
            body: args.body,
            imageurl: args.imageurl),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class PushNotificationArguments {
  const PushNotificationArguments({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant PushNotificationArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class MessageViewArguments {
  const MessageViewArguments({
    this.key,
    required this.id,
    this.notificationData,
    required this.title,
    required this.body,
    required this.imageurl,
  });

  final _i4.Key? key;

  final String id;

  final List<Map<String, dynamic>>? notificationData;

  final String title;

  final String body;

  final String imageurl;

  @override
  String toString() {
    return '{"key": "$key", "id": "$id", "notificationData": "$notificationData", "title": "$title", "body": "$body", "imageurl": "$imageurl"}';
  }

  @override
  bool operator ==(covariant MessageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key &&
        other.id == id &&
        other.notificationData == notificationData &&
        other.title == title &&
        other.body == body &&
        other.imageurl == imageurl;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        id.hashCode ^
        notificationData.hashCode ^
        title.hashCode ^
        body.hashCode ^
        imageurl.hashCode;
  }
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToPushNotification({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.pushNotification,
        arguments: PushNotificationArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMessageView({
    _i4.Key? key,
    required String id,
    List<Map<String, dynamic>>? notificationData,
    required String title,
    required String body,
    required String imageurl,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.messageView,
        arguments: MessageViewArguments(
            key: key,
            id: id,
            notificationData: notificationData,
            title: title,
            body: body,
            imageurl: imageurl),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithPushNotification({
    _i4.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.pushNotification,
        arguments: PushNotificationArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMessageView({
    _i4.Key? key,
    required String id,
    List<Map<String, dynamic>>? notificationData,
    required String title,
    required String body,
    required String imageurl,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.messageView,
        arguments: MessageViewArguments(
            key: key,
            id: id,
            notificationData: notificationData,
            title: title,
            body: body,
            imageurl: imageurl),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
