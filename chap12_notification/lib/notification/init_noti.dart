// 알림 플러그인 인스턴스 생성

import 'dart:typed_data';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin notifications =
    FlutterLocalNotificationsPlugin();

initNotification() async {
  // 안드로이드 초기화 설정
  var androidInitialization = AndroidInitializationSettings(
      "app_icon"); // android/app/src/main/res/drawable 하위에 png 파일이어야 한다.
  // ios 설정
  var iosSetting = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  var initializationSettings =
      InitializationSettings(android: androidInitialization, iOS: iosSetting);

  // 초기화 실행
  await notifications.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (NotificationResponse response) {
      print("알림이 클릭됨 : ${response.payload}");
    },
  );

  // Android 알림 채널 생성
  var androidChannel = AndroidNotificationChannel(
      "test_id", // 채널 id (중복 x)
      "테스트 채널", // 채널 이름
      description: "알림에 대한 설명",
      importance: Importance.max, // 알림의 중요도 설정
      playSound: true, // 소리설정
      enableVibration: true, // 진동설정
      vibrationPattern: Int64List.fromList([0, 1000]) // 진동 패턴
      );

  // 채널 등록
  try {
    await notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
            androidChannel); // ?.는 앞에가 null 이면 뒤에 실행 (채널은 하나만 create 되게)
    print("테스트 채널 생성 완료");
  } catch (e) {
    print("테스트 채널 생성 오류 : $e");
  }
}
