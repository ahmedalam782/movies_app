import '../../network/remote/api/end_point.dart';

class ErrorServerModel {
  final bool? success;
  final int? statusCode;
  final String? statusMessage;

  ErrorServerModel({
    this.success,
    this.statusCode,
    this.statusMessage,
  });

  factory ErrorServerModel.fromJson(Map<String, dynamic> json) {
    return ErrorServerModel(
      success: json[ApiKey.success],
      statusCode: json[ApiKey.statusCode],
      statusMessage: json[ApiKey.statusMessage],
    );
  }
}
