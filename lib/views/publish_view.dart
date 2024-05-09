import 'package:flutter/material.dart';
import 'package:news_portal/title.dart';

import '../main.dart';

class PublishView extends StatefulWidget {
  const PublishView({super.key});

  @override
  State<PublishView> createState() => _PublishViewState();
}

class _PublishViewState extends State<PublishView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        title: const Text("发布新闻"),
      ),
      body: CustomScrollView(
        slivers: [
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BoxTitle("封面图", padding: EdgeInsets.only(bottom: 8)),
                    FormField(
                      builder: (state) => Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: blue1, width: 1.5),
                          color: const Color.fromRGBO(48, 87, 255, 0.08),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "上传图片",
                              style: TextStyle(color: blue1),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const BoxTitle("标题", padding: EdgeInsets.only(bottom: 8)),
                    TextFormField(
                      style: Theme.of(context).textTheme.bodyMedium,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 16),
                        filled: true,
                        hintText: "输入评论内容",
                        constraints: const BoxConstraints(maxHeight: 48),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        fillColor: iGrey1,
                      ),
                    ),
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
