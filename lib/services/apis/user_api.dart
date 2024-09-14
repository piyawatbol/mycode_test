import '../../config/config_env.dart';
import '../../models/response/response_model.dart';
import '../http_request/http_request.dart';

class UserApi {
  static Future<ResponseModel> getAllUser() async {
    final response = await HttpRequest.get(
      '${AppEnvironment.baseUrl}/user/get-all',
    );
    return response;
  }

  static Future<ResponseModel> updateUser(id, body) async {
    final response = await HttpRequest.postImage(
      '${AppEnvironment.baseUrl}/user/update/$id',
      body: body,
    );

    return response;
  }

  static Future<ResponseModel> addUser(body) async {
    final response = await HttpRequest.postImage(
      '${AppEnvironment.baseUrl}/user/add',
      body: body,
    );

    return response;
  }

  static Future<ResponseModel> delete(id) async {
    final response = await HttpRequest.delete(
      '${AppEnvironment.baseUrl}/user/delete/$id',
    );
    return response;
  }
}
