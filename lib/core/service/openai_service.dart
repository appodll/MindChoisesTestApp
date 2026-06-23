import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:mindchoises_test_app/app/data/models/remote/request/character_create_request.dart';


class OpenAiService {
  static const _url = 'https://api.openai.com/v1/chat/completions';

  Future<String> generateDescription(CharacterCreateRequest request) async {
    final apiKey = dotenv.env['OPENAI_API_KEY'] ?? '';

    if (apiKey.isEmpty || apiKey.startsWith('sk')) {
      return _mock(request);
    }

    try {
      final res = await http
          .post(
            Uri.parse(_url),
            headers: {
              'Authorization': 'Bearer $apiKey',
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'model': 'gpt-4o-mini',
              'messages': [
                {
                  'role': 'system',
                  'content':
                      'You are a creative game narrative writer. '
                      'Write a vivid second-person character description (3–4 sentences) '
                      'that feels personal and empowering. Use a slightly mystical, poetic tone. '
                      'End with exactly one line spoken in the character\'s own voice.',
                },
                {'role': 'user', 'content': _prompt(request)},
              ],
              'max_tokens': 250,
              'temperature': 0.88,
            }),
          )
          .timeout(const Duration(seconds: 25));

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body) as Map<String, dynamic>;
        final choices = data['choices'] as List<dynamic>;
        return ((choices.first['message'] as Map)['content'] as String).trim();
      }
    } catch (_) {}

    return _mock(request);
  }

  String _prompt(CharacterCreateRequest r) =>
      '''
Create a short immersive game heroine profile:
- Name: ${r.name}
- Age: ${r.age}
- Gender: ${r.gender}
- Archetype: ${r.archetype}
- Driving Goal: ${r.goal}
- Current Mood: ${r.mood}

Write in second person ("You are...").
Mention one special ability and one signature flaw.
End with one line in the character\'s voice (in quotes).
''';

  String _mock(CharacterCreateRequest r) {
    const flavorMap = {
      'Warrior': 'forged in the fires of countless battles',
      'Mage': 'gifted with ancient arcane knowledge',
      'Rogue': 'a shadow moving between worlds',
      'Healer': 'a beacon of light in dark times',
      'Ranger': 'attuned to the pulse of the wild',
      'Oracle': 'born to see what others cannot',
    };
    final flavor = flavorMap[r.archetype] ?? 'a force unlike any other';

    return 'You are ${r.name} the ${r.archetype ?? "Hero"}, $flavor. '
        'Driven by the desire to "${r.goal}", your ${(r.mood ?? "steadfast").toLowerCase()} spirit '
        'shapes every step of your journey. Your greatest strength is your '
        'unwavering will — your flaw is that you trust instinct over counsel.\n\n'
        '"I have walked through darkness to find this moment. '
        'Let us write the next chapter together."';
  }
}
