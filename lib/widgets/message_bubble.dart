import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final bool isMe;

  MessageBubble(this.sender, this.text, this.isMe);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
            ),
          ),
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(30) : Radius.circular(0),
              topRight: isMe ? Radius.circular(0) : Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Text(
                '$text',
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black87,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
