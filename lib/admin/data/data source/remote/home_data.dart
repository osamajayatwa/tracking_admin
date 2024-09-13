import 'package:bus_tracking/core/class/crud.dart';
import 'package:bus_tracking/linkapi.dart';

class AdminHomeData {
  Crud crud;
  AdminHomeData(this.crud);
  getData() async {
    var response = await crud.postData(AppLink.adminhomepage, {});
    return response.fold((l) => 1, (r) => r);
  }
}
