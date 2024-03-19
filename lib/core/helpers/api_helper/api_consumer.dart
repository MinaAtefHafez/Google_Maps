abstract class ApiConsumer {
  Future<dynamic> get(
      {required String url,
      Map<String, dynamic>? param,
      Map<String, dynamic>? headers});
  Future<dynamic> post(
      {required String url,
      Map<String, dynamic>? param,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers});
}
