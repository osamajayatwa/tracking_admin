import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminVerifySignUpData {
  Crud crud;
  AdminVerifySignUpData(this.crud);
  postverifydata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.adminverifysignupdata,
        {"email": email, "verifycode": verifycode});
    return response.fold((l) => 1, (r) => r);
  }

  resendData(String email) async {
    var response = await crud.postData(AppLink.adminresend, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
