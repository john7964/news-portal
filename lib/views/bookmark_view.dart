import 'package:flutter/material.dart';
import 'package:news_portal/main.dart';

import '../news_card.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> with SingleTickerProviderStateMixin{
  late TabController tabController = TabController(length: 2, vsync:this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: black2,
        title: const Text(
          "Bookmark",
          style: TextStyle(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child:  Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: Theme.of(context).scaffoldBackgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: FilledButton(
                          onPressed: () {},
                          child: const Text("For You"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Sports"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Conflict"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Healthy"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 20),
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text("Science"),
                        ),
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        physics: BouncingScrollPhysics(),
        controller: tabController,
        children: [
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                sliver: SliverList.separated(
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: NewsHorizontalCard(),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: iGrey2,
                  ),
                ),
              ),
            ],
          ),
          CustomScrollView(
            slivers: [
              SliverSafeArea(
                sliver: SliverList.separated(
                  itemBuilder: (context, index) => const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: NewsHorizontalCard(),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                    color: iGrey2,
                  ),
                ),
              ),
            ],
          )
        ] ,
      ),
    );
  }
}
