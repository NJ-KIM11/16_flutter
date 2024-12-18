// 알림 설정
import 'package:chap12_notification/notification/init_noti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

showNotification() async {
  // 안드로이드 알림 설정
  // 특정 알림 채널에 등록을 해주어야 한다..
  var androidDetails = AndroidNotificationDetails(
    "test_id",
    "테스트채널",
    priority: Priority.max, // 알림 순서(우선순위 설정)
    color: Colors.black,
  );

  // 애플
  var iosDetails = DarwinNotificationDetails(
    presentAlert: true, // 알림이 표시될 때 팝업을 보여줄지
    presentBadge: true, // 아이콘
    presentSound: true,
  );

  notifications.show(
      // 첫번째 파라미터 id 는 고유하여야 한다(unique 해야 알림이 겹치지 않는다)(겹치게 하려면 id를 중복해서 쓰면된다.)
      1,
      '전자문서 안내',
      'KB국민은행 김*준님, KB 국민 인증서 도착 알림',
      NotificationDetails(android: androidDetails, iOS: iosDetails),
      payload:
          "test_payload" // 어떤 알림인지 알려주는 String 작성해서 onDidRecieveNotificationResponse에서 유저가 알림 클릭시 동작을 제어할 수 있다.
      );
}
