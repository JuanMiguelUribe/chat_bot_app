import 'package:dio/dio.dart';
<<<<<<< HEAD
import 'package:chat_bot/domain/entities/message.dart';
import 'package:chat_bot/infrastructure/models/yes__no_model.dart';
=======
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes__no_model.dart';
>>>>>>> df352588c684eed00066cac2dd2fc017673c31c0

class GetYesNoAnswer {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get("https://yesno.wtf/api");

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
