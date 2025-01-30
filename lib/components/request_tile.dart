import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/community_request.dart';
import '../utils/colors.dart';

class RequestTile extends StatelessWidget {
  final CommunityRequest request;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const RequestTile({
    required this.request,
    required this.onApprove,
    required this.onReject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final status = request.status;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: getColor(status),
        border: Border.all(width: 2.0, color: getBorderColor(status)),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/profile_icon.png', height: 50, width: 50),
          const SizedBox(width: 13),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  infoColumn(label: request.name, tag: "NAME"),
                  infoColumn(label: request.email, tag: "E-MAIL"),
                  infoColumn(label: request.role, tag: "ROLE"),
                ],
              ),
            ),
          ),
          if (status == null) ...[
            approveRejectButton('assets/images/Tick Square.png', onApprove),
            const SizedBox(width: 10),
            approveRejectButton('assets/images/Close Square.png', onReject),
          ] else ...[
            actionStatus(status == "approved"
                ? "Community membership was added successfully"
                : "Community membership was declined"),
          ],
        ],
      ),
    );
  }

  Color getColor(String? status) {
    return status == "approved"
        ? Colors.green.shade100
        : status == "rejected"
            ? Colors.grey.shade100
            : UiColors.backgroundColor;
  }

  Color getBorderColor(String? status) {
    return status == "approved"
        ? Colors.green.shade300
        : status == "rejected"
            ? Colors.grey.shade400
            : UiColors.borderColor;
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
            width: Get.width / 6,
            child: Text(
              status,
              maxLines: 2,
              style: TextStyle(color: UiColors.textColor),
            ),
          ),
          const SizedBox(width: 5),
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
}
