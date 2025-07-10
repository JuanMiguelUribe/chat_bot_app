import 'package:dio/dio.dart';
import 'package:chat_bot/domain/entities/message.dart';
import 'package:chat_bot/infrastructure/models/yes__no_model.dart';

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
