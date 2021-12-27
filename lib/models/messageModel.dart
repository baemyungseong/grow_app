// import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ffi';

class Message {
  final String userId;
  final String createAt;
  final String message;
  final List contentList;

  Message({
    required this.userId,
    required this.message,
    required this.createAt,
    required this.contentList,
  });
  factory Message.fromDocument(Map<String, dynamic> doc) {
    return Message(
        contentList: doc['contentList'],
        userId: doc['sendBy'],
        message: doc['content'],
        createAt: doc['timeSend']);
  }
}
