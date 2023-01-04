


import 'package:chat_gpt/repository/ai_repository.dart';
import 'package:chat_gpt/widget/ai_message.dart';
import 'package:chat_gpt/widget/loading.dart';
import 'package:chat_gpt/widget/message.dart';
import 'package:flutter/widgets.dart';

class ChatModel extends ChangeNotifier {
  List<Widget> messages = [];

  List<Widget> get getMessages => messages;

  Future<void> sendChat(String txt) async {
    addUserMessage(txt);

    Map<String, dynamic> response =
        await OpenAiRepository.sendMessage(prompt: txt);
    String text = response['choices'][0]['text'];
    //remove the last item
    messages.removeLast();
    messages.add(AiMessage(text: text));

    notifyListeners();
  }

  void addUserMessage(txt) {
    messages.add(UserMessage(text: txt));
    messages.add(const Loading(text: "..."));
    notifyListeners();
  }
}