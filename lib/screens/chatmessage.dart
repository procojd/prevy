import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:prevy/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({this.text, this.sender, this.isImage = false});

  final String text;
  final String sender;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sender,
          style: TextStyle(
              fontFamily: kf1, color: kcp1, fontWeight: FontWeight.w100),
        )
            .text
            .subtitle1(context)
            .make()
            .box
            .color(sender == "You" ? Colors.lime[900] : kcp8.withOpacity(0.5))
            .p16
            .rounded
            .alignCenter
            .makeCentered(),
        Expanded(
          child: isImage
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    text,
                    loadingBuilder: (context, child, loadingProgress) =>
                        loadingProgress == null
                            ? child
                            : Transform.scale(
                                scaleX: 0.45,
                                scaleY: 0.8,
                                child: CircularProgressIndicator(
                                  strokeWidth: 5,
                                  color: kcp8,
                                ),
                              ),
                  ),
                )
              : text.trim().text.bodyText1(context).make().px8(),
        ),
      ],
    ).py8();
  }
}
