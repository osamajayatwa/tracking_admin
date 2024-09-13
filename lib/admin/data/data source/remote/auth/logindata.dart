import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminLoginData {
  Crud crud;
  AdminLoginData(this.crud);
  loginpostdata(String email, String password) async {
    var response = await crud.postData(AppLink.adminlogin, {
      "email": email,
      "password": password,
    });
    print(response);
    return response.fold((l) => 1, (r) => r);
  }
}
