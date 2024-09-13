import 'package:bus_tracking/core/class/statusrequest.dart';

handilingData(response) {
  if (response is StatusRequest) {
    return response;
  } else {
    return StatusRequest.success;
  }
}
