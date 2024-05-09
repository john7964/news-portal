import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:news_portal/swiper.dart';
import 'package:news_portal/title.dart';
import 'package:news_portal/views/search_view.dart';

import '../button.dart';
import '../main.dart';
import '../news_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Row(
                children: [
                  SizedBox(
                    height: 38,
                    width: 38,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: CachedNetworkImage(
                          imageUrl: "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/alexander-hipp-iEEBWgY_6lA-unsplash.jpg"),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("欢迎，",
                          style: TextStyle(
                              color: grey1, fontSize: 12, height: 1.4)),
                      Text("小明明",
                          style: TextStyle(
                              color: Colors.white, fontSize: 15, height: 1.4)),
                    ],
                  ),
                ],
              ),
              actions: [
                FilledButton(
                  onPressed: () {
                    Navigator.of(context,rootNavigator: true).push(
                      MaterialPageRoute(
                          builder: (context) => const SearchView()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    backgroundColor: black3,
                  ),
                  child: const Icon(Icons.search_rounded, size: 24),
                )
              ],
              pinned: true,
              stretch: true,
              stretchTriggerOffset: 1.0,
              expandedHeight: 330.0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Container(
                color: black2,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).viewPadding.top + 80,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: LayoutBuilder(builder: (context, constrains) {
                        var left = 200 - constrains.maxHeight;
                        var opacity = left < 0 ? 1.0 : 1 - left / 200;
                        return Offstage(
                          offstage: constrains.maxHeight < 50,
                          child: Opacity(
                            opacity: opacity,
                            child: Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Swiper(
                                itemCount: 4,
                                pagination: SwiperPagination(
                                  builder: SwiperLinePagination(
                                      const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8)),
                                ),
                                outer: true,
                                layout: SwiperLayout.DEFAULT,
                                viewportFraction: 0.85,
                                scale: 0.85,
                                itemBuilder: (context, index) => NewsStackCard(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SliverStickyHeader.builder(
              builder: (context, state) => const BoxTitle("Popular Category",
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 12)),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  children: [
                    UnconstrainedBox(
                        child: CategoryButton(
                            text: "Sport", icon: Icons.sports_esports)),
                    UnconstrainedBox(
                        child: CategoryButton(
                            text: "Technology", icon: Icons.military_tech)),
                    UnconstrainedBox(
                        child: CategoryButton(
                            text: "Nature",
                            icon: Icons.nature_people_outlined)),
                    UnconstrainedBox(
                        child: CategoryButton(
                            text: "Education", icon: Icons.menu_book_sharp)),
                    UnconstrainedBox(
                      child: CategoryButton(
                          text: "Health and Wellness",
                          icon: Icons.health_and_safety_outlined),
                    ),
                  ],
                ),
              ),
            ),
            SliverStickyHeader.builder(
              builder: (context, state) => const BoxTitle("Recommendation",
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 12)),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: index == 2 ? 20 : 0),
                        child: const NewsVerticalCard(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SliverTitle("Trending Now",
                padding: EdgeInsets.fromLTRB(20, 16, 20, 16)),
            SliverStickyHeader.builder(
              builder: (context, state) => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: FilledButton(
                            onPressed: () {}, child: const Text("For You")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text("Sports")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text("Conflict")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text("Healthy")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 20),
                        child: OutlinedButton(
                            onPressed: () {}, child: const Text("Science")),
                      ),
                    ],
                  ),
                ),
              ),
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
      );
    });
  }
}
