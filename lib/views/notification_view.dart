import 'package:flutter/material.dart';
import 'package:news_portal/main.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleTextStyle: Theme.of(context)
            .appBarTheme
            .titleTextStyle!
            .copyWith(color: Colors.black),
        title: const Text("通知消息"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            sliver: SliverList.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      color: iGrey1,
                    ),
                    width: 52,
                    height: 52,
                    child: const Center(
                      child: Icon(
                        Icons.message_rounded,
                        color: blue1,
                      ),
                    ),
                  ),
                  title: const Text("Account Verification", maxLines: 1),
                  subtitle: const Text(
                      "You have successfully add verify your phone number",
                      maxLines: 2),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("刚刚"),
                      const SizedBox(height: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                color: iGrey1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
