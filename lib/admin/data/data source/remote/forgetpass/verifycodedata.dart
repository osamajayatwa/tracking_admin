import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminVerifyCodeForgetPassData {
  Crud crud;
  AdminVerifyCodeForgetPassData(this.crud);
  forgetdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.adminforgetverifycode, {
      "email ": email,
      "verifycode ": verifycode,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
