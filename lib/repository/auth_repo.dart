import 'package:final_social_app/repository/app_con.dart';
import 'package:http/http.dart';

class AuthRepo {
  static Future loginApi({String name, String password}) async {
    return await post(Uri.parse('${AppConfig.baseUrl}/login'), body: {
      'name': '$name',
      'password': '$password',
    });
  }

  static Future registerApi(
      {String name, String email, String password}) async {
    return await post(
      Uri.parse('${AppConfig.baseUrl}/register'),
      body: {
        'name': '$name',
        'email': '$email',
        'password': '$password',
        'device_token': 'dtoken',
        'device_type': 'dtype',
        'device_id': 'did',
      },
    );
  }
}
