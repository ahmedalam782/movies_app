abstract class ApiConsumer {
  Future<dynamic> get(
    Uri url, {
    Map<String, String>? headers,
  });
}
