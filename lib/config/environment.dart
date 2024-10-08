import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static const String _envFile = ".env";

  static String get fileName {
    return _envFile;
  }

  static String get googleGeminiApiKey => dotenv.env['GOOGLE_GEMINI_API_KEY']!;
  static String get replicateApiKey => dotenv.env['REPLICATE_API_TOKEN']!;
}
