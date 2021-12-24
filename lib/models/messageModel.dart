// import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ffi';

class MessageModel {
  final String userId;
  final String createAt;
  final String message;

  MessageModel({
    required this.userId,
    required this.message,
    required this.createAt,
  });
  factory MessageModel.fromDocument(Map<String, dynamic> doc) {
    return MessageModel(
        userId: doc['userIdS1'],
        message: doc['userIdS2'],
        createAt: doc['messageId']);
  }
}
