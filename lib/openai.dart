import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAI {

 //API_KEY: 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
  final String apiKey;

  OpenAI({required this.apiKey});

  Future<String> generateText(String prompt) async {
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/engines/davinci-codex/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        'prompt': prompt,
        'max_tokens': 50,
        'n': 1,
        'stop': '\n',
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final text = jsonResponse['choices'][0]['text'].toString();
      return text;
    } else {
      throw Exception('Failed to generate text: ${response.statusCode}');
    }
  }
}