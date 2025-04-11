import 'package:ds/ds.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ioc_contact_request/src/modules/b2c/widgets/dotted_line.dart';

class StatusListScreen extends StatefulWidget {
  const StatusListScreen({super.key});

  @override
  StatusListScreenState createState() => StatusListScreenState();
}

class StatusListScreenState extends State<StatusListScreen> {
  int selectedIndex = 0;

  final List<StatusItem> statuses = [
    StatusItem("Liên hệ KH", "hienntt81", "23/12/2025", true),
    StatusItem("Tiếp xúc trực tiếp", "", "", false),
    StatusItem("Hoàn tất", "", "", false),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
    padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return StatusItemWidget(
          status: statuses[index],
          isSelected: index == selectedIndex,
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
        );
      },
      separatorBuilder: (context, index) => const Gap(DSSpacing.spacing4),
      itemCount: statuses.length,
    );
  }
}

class StatusItem {
  final String title;
  final String executor;
  final String deadline;
  final bool isActive;

  StatusItem(this.title, this.executor, this.deadline, this.isActive);
}

class StatusItemWidget extends StatelessWidget {
  final StatusItem status;
  final bool isSelected;
  final VoidCallback onTap;

  const StatusItemWidget({
    super.key,
    required this.status,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.3,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                // CircleAvatar(
                //   radius: 12,
                //   backgroundColor: isSelected ? Colors.red : Colors.grey[400],
                //   child: Icon(Icons.circle, size: 12, color: isSelected ? Colors.white : Colors.grey[500]),
                // ),
                Container(
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: isSelected ? DSColors.primary : DSColors.borderDefault,
                        width: 1,
                      ),
                    ),
                    color: isSelected ? DSColors.primarySurface : DSColors.backgroundGray1,
                  ),
                  padding: EdgeInsets.all(DSSpacing.spacing2),
                  child: Icon(Icons.circle, size: 12, color: isSelected ? DSColors.primary : Colors.transparent),
                ),
                const Gap(DSSpacing.spacing4),
                Flexible(
                  child: DottedLine(
                    direction: Axis.horizontal,
                    dashColor: DSColors.borderDefault,
                    isDotCircle: true,
                  ),
                ),
              ],
            ),
            const Gap(DSSpacing.spacing25),
            Text(
              status.title,
              style: DSTextStyle.labelMedium.applyColor(
                isSelected ? DSColors.primary : DSColors.textSubtitle,
              ),
            ),
            if (status.executor.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Thực hiện: ${status.executor}",
                    style: DSTextStyle.captionSmall.applyColor(
                      DSColors.textSubtitle,
                    ),
                  ),
                  Text(
                    "Hạn: ${status.deadline}",
                    style: DSTextStyle.captionSmall.applyColor(
                      DSColors.textSubtitle,
                    ),
                  ),
                ],
              ),
            if (isSelected)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    "Đang thực hiện",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
