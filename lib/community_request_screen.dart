import 'package:coumminty_member_request/Controller/community_requests_controller.dart';
import 'package:coumminty_member_request/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityRequestsScreen extends StatefulWidget {
  const CommunityRequestsScreen({super.key});

  @override
  State<CommunityRequestsScreen> createState() => _CommunityRequestsScreenState();
}

class _CommunityRequestsScreenState extends State<CommunityRequestsScreen> {
  final CommunityRequestsController controller = Get.put(CommunityRequestsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.requests.length,
          itemBuilder: (context, index) {
            final status = controller.requestStatus[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: status == "approved"
                    ? Colors.green.shade100
                    : status == "rejected"
                        ? Colors.grey.shade100
                        : UiColors.backgroundColor,
                border: Border.all(
                  width: 2.0,
                  color: status == "approved"
                      ? Colors.green.shade300
                      : status == "rejected"
                          ? Colors.grey.shade400
                          : UiColors.borderColor,
                ),
              ),
              child: Row(
                children: [
                  // Profile Image
                  Image.asset(
                    'assets/images/profile_icon.png',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 13),

                  // Scrollable Information Columns
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          infoColumn(
                            label: controller.requests[index]['name']!,
                            tag: "NAME",
                          ),
                          infoColumn(
                            label: controller.requests[index]['email']!,
                            tag: "E-MAIL",
                          ),
                          infoColumn(
                            label: controller.requests[index]['role']!,
                            tag: "ROLE",
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Approve/Reject Buttons or Status
                  if (status == null) ...[
                    // Approve Button
                    approveRejectButton(
                      'assets/images/Tick Square.png',
                      () {
                        controller.approveRequest(index);
                        setState(() {});
                      },
                    ),
                    const SizedBox(width: 10),
                    // Reject Button
                    approveRejectButton(
                      'assets/images/Close Square.png',
                      () {
                        controller.rejectRequest(index);
                        setState(() {});
                      },
                    ),
                  ] else if (status == "approved") ...[
                    // Approved Status
                    actionStatus("Community membership was added successfully"),
                  ] else if (status == "rejected") ...[
                    // Rejected Status
                    actionStatus("Community membership was declined"),
                  ],
                ],
              ),
            );
          },
        );
      }),
    );
  }

  Widget approveRejectButton(String imagePath, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Image.asset(
        imagePath,
        height: 40,
        width: 40,
      ),
    );
  }

  Widget actionStatus(String status) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(
              status,
              maxLines: 2,
              style: TextStyle(
                color: UiColors.textColor,
              ),
            ),
          ),
          Image.asset(
            status == "Community membership was added successfully"
                ? 'assets/images/Tick Square.png'
                : 'assets/images/Close Square.png',
            height: 40,
            width: 40,
          ),
        ],
      ),
    );
  }

  Widget infoColumn({required String label, required String tag}) {
    return SizedBox(
      width: Get.width / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: UiColors.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: UiColors.tagContainerColor,
            ),
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Text(
              tag,
              style: TextStyle(
                color: UiColors.textColor,
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
