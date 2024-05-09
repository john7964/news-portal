import 'package:flutter/material.dart';

import '../main.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            stretch: true,
            stretchTriggerOffset: 1.0,
            expandedHeight: 330.0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(color: black2),
          ),
          SliverList.list(children: [
            ListTile(
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
              title: const Text("Account Preferences", maxLines: 1),
              subtitle: const Text("Edit name, username and display name",
                  maxLines: 1),
              trailing: const Icon(Icons.chevron_right),
            ),
            ListTile(
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
              trailing: Switch.adaptive(
                value: false,
                onChanged: (value) {},
              ),
              title: const Text("Dark Mode", maxLines: 1),
              subtitle: const Text("Dissable", maxLines: 1),

            ),
            ListTile(
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
                    color: blue1
                  ),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              title: const Text("Privacy & Security", maxLines: 1),
              subtitle: const Text("Biometrics login & password", maxLines: 1),
            ),
            ListTile(
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
              trailing: const Icon(Icons.chevron_right),
              title: const Text("Help Centre", maxLines: 1),
              subtitle: const Text("Terms and conditions, Privacy Policy",
                  maxLines: 1),
            ),
          ]),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: OutlinedButton(
                style: Theme.of(context).outlinedButtonTheme.style!.copyWith(
                      foregroundColor:
                          const MaterialStatePropertyAll(Colors.red),
                      side: const MaterialStatePropertyAll(
                          BorderSide(color: Colors.red, width: 1)),
                    ),
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout_rounded),
                    SizedBox(width: 6),
                    Text("登出"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
