import 'package:flutter/material.dart';
import 'package:chat_bot/core/utils/get_yes_no_answer.dart';
import 'package:chat_bot/domain/entities/message.dart';
import 'package:chat_bot/core/utils/get_gemini_reply.dart'; // Asegúrate de que este import esté correcto

class ChatProvider extends ChangeNotifier {
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();
  List<Message> messageList = [
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if (text.endsWith("?")) {
      await herReply();
    } else {
      final aiText = await getGeminiReply(text);
      print("AI Text: $aiText");
        final botMessage = Message(text: aiText, fromWho: FromWho.friend);
        messageList.add(botMessage);
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {

    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<String> getGeminiReply(String text) async {
    return await GeminiService.getGeminiReply(text);
  }

}
