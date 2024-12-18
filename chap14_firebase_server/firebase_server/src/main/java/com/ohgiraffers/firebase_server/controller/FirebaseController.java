package com.ohgiraffers.firebase_server.controller;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/fcm")
public class FirebaseController {

    @PostMapping("/register-token")
    public ResponseEntity<String> registToken(@RequestBody Map<String, String> tokenRequest) {
        String token = tokenRequest.get("token");
        System.out.println(token);

        try{
            Message message = Message.builder()
                    .setToken(token)
                    .setNotification(Notification.builder()
                            .setTitle("테스트 알림")
                            .setBody("서버측 테스트 메시지")
                            .build())
                    .build();
            String response = FirebaseMessaging.getInstance().send(message);
            System.out.println(response);
        } catch (FirebaseMessagingException e) {
            throw new RuntimeException(e);
        }

        if(token != null){
            return ResponseEntity.ok("토큰 등록 완료");
        }else {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("토큰 없음");
        }
    }

}
