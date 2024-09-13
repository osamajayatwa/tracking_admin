import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminSignupData {
  Crud crud;
  AdminSignupData(this.crud);
  postdata(String username, String email, String password, String phone) async {
    var response = await crud.postData(AppLink.adminsignup, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone
    });
    return response.fold((l) => 1, (r) => r);
  }
}
