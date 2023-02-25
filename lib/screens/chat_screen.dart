import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:prevy/constant.dart';
import 'package:velocity_x/velocity_x.dart';

import 'chatmessage.dart';
import 'threedots.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  OpenAI chatGPT;
  bool _isImageSearch = false;

  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance.build(
        token: dotenv.env["API_KEY"],
        baseOption: HttpSetup(receiveTimeout: 100000));
    super.initState();
  }

  @override
  void dispose() {
    chatGPT?.close();
    chatGPT?.genImgClose();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys
// 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
  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "You",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    if (_isImageSearch) {
      final request = GenerateImage(message.text, 1, size: "256x256");

      final response = await chatGPT.generateImage(request);
      Vx.log(response.data.last.url);
      insertNewData(response.data.last.url, isImage: true);
    } else {
      final request =
          CompleteText(prompt: message.text, model: kTranslateModelV3);

      final response = await chatGPT.onCompleteText(request: request);
      Vx.log(response.choices[0].text);
      insertNewData(response.choices[0].text, isImage: false);
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "chitti",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: kcp6.withOpacity(0.3),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                onSubmitted: (value) => _sendMessage(),
                decoration: const InputDecoration.collapsed(
                    hintText: "Question/description",
                    hintStyle: TextStyle(
                        color: kcp1,
                        fontFamily: kf1,
                        fontSize: 15,
                        fontWeight: FontWeight.w200)),
              ),
            ),
            ButtonBar(
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    CupertinoIcons.arrowshape_turn_up_right_fill,
                    color: kcp2,
                  ),
                  onPressed: () {
                    _isImageSearch = false;
                    _sendMessage();
                  },
                ),
                TextButton(
                    onPressed: () {
                      _isImageSearch = true;
                      _sendMessage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: kcp1, borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Text("Get Image",
                            style: TextStyle(
                                color: kcp3,
                                fontFamily: kf2,
                                fontSize: 15,
                                fontWeight: FontWeight.w400)),
                      ),
                    ))
              ],
            ),
          ],
        ).px8(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kcp3,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: kcp3,
          title: Center(
              child: const Text(
            "AI chats & Image",
            style: TextStyle(fontFamily: kf1, color: kcp1),
          )),
          elevation: 0,
        ),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: context.cardColor,
                    color: kcp3),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}
