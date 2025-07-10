import 'package:chat_bot/domain/entities/message.dart';

abstract class MessageRepository {
   Future<Message> getYesNoAnswer();
  Future<Message> getAIResponse(String prompt);
}
