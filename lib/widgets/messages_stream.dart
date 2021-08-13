import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import './message_bubble.dart';

class MessagesStream extends StatelessWidget {
  final FirebaseFirestore _firestore;
  final User _loggedInUser;

  MessagesStream(this._firestore, this._loggedInUser);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream:
          _firestore.collection('messages').orderBy('timestamp').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs.reversed;
        List<MessageBubble> messageBubbles = [];
        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final currentUser = _loggedInUser.email;
          final messageBubble = MessageBubble(
            messageSender,
            messageText,
            currentUser == messageSender,
          );
          messageBubbles.add(messageBubble);
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
