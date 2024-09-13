import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);
  loginpostdata(String username, String password) async {
    var response = await crud.postData(AppLink.logindata, {
      "username": username,
      "password": password,
    });
    print(response);
    return response.fold((l) => 1, (r) => r);
  }
}
