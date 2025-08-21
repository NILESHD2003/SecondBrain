import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static Future<List<double>> generateEmbeddings(
    String text,
    String model,
    String apiKey,
  ) async {
    final model = GenerativeModel(model: 'embedding-001', apiKey: apiKey);
    print('making API call'); 
    try {
      final response = await model.embedContent(Content.text(text));

      return response.embedding.values;
    } catch (error) {
      print("Error generating embedding: $error");
      return [];
    }
  }
}
