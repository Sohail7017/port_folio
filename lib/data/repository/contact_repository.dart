
import 'package:http/http.dart' as http;
import 'dart:convert';

class ContactRepository{

 static Future<void> sendMessage({
    required String name,
    required String email,
    required String phone,
    required String subject,
    required String message,
  }) async {
    const url = "https://api.web3forms.com/submit";
    const accessKey = "7166da20-8ba7-4d3d-9de1-560fba82b214";

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "access_key": accessKey,
          "name": name,
          "email": email,
          "phone": phone,
          "subject": subject,
          "message": message,
        }),
      );

      final data = jsonDecode(response.body);

      if (data["success"] == true) {
        print("✅ Message sent successfully!");
      } else {
        print("❌ Error: ${data['message']}");
      }
    } catch (e) {
      print("⚠️ Something went wrong: $e");
    }
  }

}