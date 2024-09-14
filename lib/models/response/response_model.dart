class ResponseModel {
  final bool isSucces;
  final String? message;
  final dynamic data;
  final String path;
  final int statusCode;
  final String method;
  ResponseModel({
    required this.isSucces,
    required this.data,
    required this.path,
    required this.statusCode,
    required this.method,
    this.message,
  });
}
