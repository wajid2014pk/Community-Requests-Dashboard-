import 'package:get/get.dart';

import '../model/community_request.dart';

class CommunityRequestsController extends GetxController {
  var requests = <CommunityRequest>[
    CommunityRequest(name: 'John Doe', email: 'john@example.com', role: 'Member'),
    CommunityRequest(name: 'Jane Smith', email: 'jane@example.com', role: 'Admin'),
    CommunityRequest(name: 'Alice Johnson', email: 'alice@example.com', role: 'Member'),
  ].obs;

  void approveRequest(int index) {
    requests[index].status = "approved";
    requests.refresh();
  }

  void rejectRequest(int index) {
    requests[index].status = "rejected";
    requests.refresh();
  }
}
