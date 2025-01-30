import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/request_tile.dart';
import '../controller/community_requests_controller.dart';

class CommunityRequestsScreen extends StatelessWidget {
  CommunityRequestsScreen({super.key});

  final CommunityRequestsController controller = Get.put(CommunityRequestsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.requests.length,
            itemBuilder: (context, index) {
              final request = controller.requests[index];

              return RequestTile(
                request: request,
                onApprove: () => controller.approveRequest(index),
                onReject: () => controller.rejectRequest(index),
              );
            },
          ),
        );
      }),
    );
  }
}
