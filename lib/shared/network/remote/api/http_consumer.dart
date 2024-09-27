import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'api_consumer.dart';

class HttpConsumer extends ApiConsumer {
  @override
  Future<dynamic> get(Uri url, {Map<String, String>? headers}) async {
    Response response = await http.get(
      url,
      headers: headers,
    );
    final json = jsonDecode(response.body);
    return json;
  }
}
