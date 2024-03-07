import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiConfigurations {
  Future<Response> get(
      String path, String unencodedPath, Map<String, dynamic>? queryParameters,
      {Map<String, String>? headers}) async {
    final response = await http.get(
      Uri.https(path, unencodedPath, queryParameters),
      headers: headers,
    );

    return response;
  }
}
