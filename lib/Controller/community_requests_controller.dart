import 'package:get/get.dart';

class CommunityRequestsController extends GetxController {
  // Dummy data for requests
  var requests = [
    {'name': 'John Doe', 'email': 'john@example.com', 'role': 'Member'},
    {'name': 'Jane Smith', 'email': 'jane@example.com', 'role': 'Admin'},
    {'name': 'Alice Johnson', 'email': 'alice@example.com', 'role': 'Member'},
  ].obs;

  // List to track the status of requests
  var requestStatus = <String?>[null, null, null].obs;

  void approveRequest(int index) {
    if (requestStatus[index] == null) {
      requestStatus[index] = "approved";
    }
  }

  void rejectRequest(int index) {
    if (requestStatus[index] == null) {
      requestStatus[index] = "rejected";
    }
  }
}
