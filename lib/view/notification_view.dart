import 'package:flutter/material.dart';
import 'package:donation_app/utils/app_color.dart';
import 'package:intl/intl.dart'; // For date formatting

import '../view_model/notification_setting.dart'; // Import the NotificationSetting widget

class NotificationView extends StatelessWidget {
  NotificationView({super.key});

  // Temporary notification data
  final List<Map<String, String>> notifications = [
    {
      "title": "Important Update",
      "text":
          "Stay updated! Enable notifications to receive alerts about important updates, offers, and reminders from GiveHope Enable notifications to receive alerts about important updates,.",
      "time": "2024-09-23 10:45", // Example date (Yesterday)
    },
    {
      "title": "Short Notification",
      "text": "This is a short notification.",
      "time": "2024-09-24 12:30", // Example date (Today)
    },
    {
      "title": "Reminder",
      "text": "Test notification from last week.",
      "time": "2024-09-18 13:15", // Example date (Last Week)
    },
  ];

  // Function to get the label based on the notification date
  String getNotificationLabel(String notificationTime) {
    final notificationDate = DateTime.parse(notificationTime);
    final now = DateTime.now();

    if (now.difference(notificationDate).inDays == 0 &&
        notificationDate.day == now.day) {
      return "Today";
    }
    if (now.difference(notificationDate).inDays == 1 &&
        now.day - notificationDate.day == 1) {
      return "Yesterday";
    }
    if (now.difference(notificationDate).inDays > 1 &&
        now.difference(notificationDate).inDays <= 7) {
      return "Last Week";
    }
    if (now.month == notificationDate.month) {
      return "This Month";
    }
    return DateFormat('MMMM d').format(notificationDate);
  }

  // Group notifications by their label
  Map<String, List<Map<String, String>>> groupNotifications() {
    final Map<String, List<Map<String, String>>> groupedNotifications = {};

    for (var notification in notifications) {
      final label = getNotificationLabel(notification['time']!);
      if (groupedNotifications.containsKey(label)) {
        groupedNotifications[label]!.add(notification);
      } else {
        groupedNotifications[label] = [notification];
      }
    }

    return groupedNotifications;
  }

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = groupNotifications(); // Grouped notifications

    // Define the order in which labels should be displayed
    final List<String> labelOrder = [
      "Today",
      "Yesterday",
      "Last Week",
      "This Month"
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundBodyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: AppColor.themeColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(8),
                  child:
                      const Icon(Icons.arrow_back, color: AppColor.themeColor),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.014),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "Notification",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Stay updated! Enable notifications to receive alerts about important updates, offers, and reminders from",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    TextSpan(
                      text: " GiveHope.",
                      style: TextStyle(
                        color: AppColor.themeColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.014),
              Expanded(
                child: notifications.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/notification.png'),
                            const SizedBox(height: 20),
                            const Text(
                              'No Notifications',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: labelOrder.map((label) {
                            final notificationList =
                                groupedNotifications[label] ?? [];

                            if (notificationList.isEmpty) {
                              return const SizedBox(); // If no notifications under this label, skip
                            }

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 16.0),
                                  child: Text(
                                    label,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                ...notificationList.map((notification) {
                                  return NotificationSetting(
                                    notificationText: notification['text']!,
                                    notificationTitle: notification['title']!,
                                    notificationTime: label,
                                  );
                                }),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
