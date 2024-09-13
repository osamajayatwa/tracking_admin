import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminCheckEmailData {
  Crud crud;
  AdminCheckEmailData(this.crud);
  loginpostdata(
    String email,
  ) async {
    var response = await crud.postData(AppLink.admincheckEmail, {
      "email ": email,
    });
    return response.fold((l) => 1, (r) => r);
  }
}
