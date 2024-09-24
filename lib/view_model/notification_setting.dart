import 'package:flutter/material.dart';
import 'package:donation_app/utils/app_color.dart';

class NotificationSetting extends StatefulWidget {
  final String notificationText;
  final String notificationTitle;
  final String notificationTime;

  const NotificationSetting({
    super.key,
    required this.notificationText,
    required this.notificationTitle,
    required this.notificationTime,
  });

  @override
  NotificationSettingState createState() => NotificationSettingState();
}

class NotificationSettingState extends State<NotificationSetting>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  bool showReadMoreButton = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkReadMoreVisibility();
    });
  }

  void _checkReadMoreVisibility() {
    final text = widget.notificationText;
    final textSpan = TextSpan(
      text: text,
      style: const TextStyle(fontFamily: "Poppins"),
    );
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 2,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      maxWidth:
          MediaQuery.of(context).size.width - 150, // Adjust max width as needed
    );
    final didExceedMaxLines = textPainter.didExceedMaxLines;

    if (didExceedMaxLines) {
      setState(() {
        showReadMoreButton = true;
      });
    } else {
      setState(() {
        showReadMoreButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notification title and time row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.notificationTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "Poppins",
                  ),
                ),
                Text(
                  widget.notificationTime,
                  style: const TextStyle(
                    color: AppColor.themeColor,
                    fontSize: 12,
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), // Spacing between title/time and text
            AnimatedCrossFade(
              firstChild: Text(
                widget.notificationText,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              secondChild: Text(
                widget.notificationText,
                style: const TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.easeInOut,
              secondCurve: Curves.easeInOut,
            ),
            if (showReadMoreButton)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Hide" : "Read More",
                  style: const TextStyle(
                    color: AppColor.themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
