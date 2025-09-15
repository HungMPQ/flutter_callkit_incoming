import 'package:flutter_callkit_incoming/entities/notification_params.dart';
import 'package:json_annotation/json_annotation.dart';

import 'android_params.dart';
import 'ios_params.dart';

part 'call_kit_params.g.dart';

/// Object config for General.
@JsonSerializable(explicitToJson: true)
class CallKitParams {
  const CallKitParams({
    this.id,
    this.nameCaller,
    this.appName,
    this.avatar,
    this.handle,
    this.type,
    this.normalHandle,
    this.duration,
    this.textAccept,
    this.textDecline,
    this.missedCallNotification,
    this.callingNotification,
    this.extra,
    this.headers,
    this.android,
    this.ios,
  });

  final String? id;
  final String? nameCaller;
  final String? appName;
  final String? avatar;
  final String? handle;
  final int? type;
  final int? normalHandle;
  final int? duration;
  final String? textAccept;
  final String? textDecline;
  final NotificationParams? missedCallNotification;
  final NotificationParams? callingNotification;
  final Map<String, dynamic>? extra;
  final Map<String, dynamic>? headers;
  final AndroidParams? android;
  final IOSParams? ios;

  factory CallKitParams.fromJson(Map<String, dynamic> json) =>
      _$CallKitParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CallKitParamsToJson(this);

  CallKitParams copyWith({
    String? id,
    String? nameCaller,
    String? appName,
    String? avatar,
    String? handle,
    int? type,
    int? normalHandle,
    int? duration,
    String? textAccept,
    String? textDecline,
    NotificationParams? missedCallNotification,
    NotificationParams? callingNotification,
    Map<String, dynamic>? extra,
    Map<String, dynamic>? headers,
    AndroidParams? android,
    IOSParams? ios,
  }) {
    return CallKitParams(
      id: id ?? this.id,
      nameCaller: nameCaller ?? this.nameCaller,
      appName: appName ?? this.appName,
      avatar: avatar ?? this.avatar,
      handle: handle ?? this.handle,
      type: type ?? this.type,
      normalHandle: normalHandle ?? this.normalHandle,
      duration: duration ?? this.duration,
      textAccept: textAccept ?? this.textAccept,
      textDecline: textDecline ?? this.textDecline,
      missedCallNotification:
          missedCallNotification ?? this.missedCallNotification,
      callingNotification: callingNotification ?? this.callingNotification,
      extra: extra ?? this.extra,
      headers: headers ?? this.headers,
      android: android ?? this.android,
      ios: ios ?? this.ios,
    );
  }
}
