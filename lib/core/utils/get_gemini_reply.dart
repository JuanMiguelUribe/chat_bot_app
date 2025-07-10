
import 'dart:convert';

import 'package:http/http.dart' as http;

class GeminiService {
  static const String _apiKey = 'AIzaSyClCtGbDhRuc9_8uE9zpES0GHZn6AUC2qU';
  static const String _apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$_apiKey';

    static Future<String> getGeminiReply(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": userMessage},
              ],
            },
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        final candidates = data["candidates"];
        if (candidates != null &&
            candidates.isNotEmpty &&
            candidates[0]["content"] != null &&
            candidates[0]["content"]["parts"] != null &&
            candidates[0]["content"]["parts"].isNotEmpty &&
            candidates[0]["content"]["parts"][0]["text"] != null) {
          return candidates[0]["content"]["parts"][0]["text"];
        } else {
          print("Estructura de respuesta inesperada: ${response.body}");
          return "La IA respondió algo que no pude entender 🤖";
        }
      } else {
        print('Error Gemini: ${response.body}');
        return "Error del servidor de IA 💥";
      }
    } catch (e) {
      print("Excepción en getGeminiReply: $e");
      return "Error inesperado al contactar a la IA 😵";
    }
  }
}

