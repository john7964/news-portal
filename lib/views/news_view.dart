import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:news_portal/news_card.dart';
import 'package:news_portal/title.dart';

import '../main.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  var content = """
The arrival of winter often means the arrival of snow, blanketing the landscape in a beautiful and peaceful white coat. This annual phenomenon has the power to transform even the most mundane settings into breathtaking winter wonderlands. Snow-covered trees, rooftops, and streets create a serene and magical ambiance, bringing joy and wonder to both adults and children alike.

In many regions, the snow also brings opportunities for outdoor activities such as skiing, snowboarding, sledding, and building snowmen. People of all ages venture outside to embrace the season and enjoy the winter wonderland that nature has created.

However, it's not just about the picturesque views and fun activities that snow brings. Snow is also important for the environment and the ecosystem. The snow acts as a natural insulator, protecting plants and animals from the harsh winter temperatures. When the snow melts in the spring, it provides water to the soil and helps to replenish groundwater supplies, which are essential for healthy plant growth.

In addition, snow is also important for the winter tourism industry, which provides jobs and economic benefits for many regions. Many people travel from all over the world to experience the beauty and wonder of a snow-covered landscape.

As beautiful and enchanting as snow can be, it's important to remember to stay safe during the winter season. Proper clothing, footwear, and driving techniques can make all the difference in ensuring a safe and enjoyable winter experience.

In conclusion, the snow that blankets the sky and creates a winter wonderland is a beautiful and important part of the natural world. It brings joy and wonder to our lives, supports the environment and ecosystem, and provides economic benefits for many regions. So, let's embrace the winter season, appreciate the snow, and enjoy the wonderland that it creates.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                pinned: true,
                stretch: true,
                stretchTriggerOffset: 1.0,
                collapsedHeight: MediaQuery.of(context).viewPadding.top + 110,
                expandedHeight: 330.0,
                iconTheme: const IconThemeData(color: Colors.white),
                flexibleSpace: const NewsStackCard(
                  padding: EdgeInsets.all(20),
                  simple: false,
                  top: 50,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(content),
                ),
              ),
              SliverStickyHeader.builder(
                builder: (context, state) => const BoxTitle("相关新闻",
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).viewPadding.bottom + 90,
                ),
              )
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  stops: const [0.0, 0.7],
                ),
              ),
              height: MediaQuery.of(context).viewPadding.bottom + 90,
              child: const Center(
                child: UnconstrainedBox(
                  child: NewsAction(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NewsAction extends StatelessWidget {
  const NewsAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: black3,
      ),
      child: Wrap(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: Theme.of(context).textTheme.labelSmall,
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.thumb_up, size: 20, color: Colors.white),
                SizedBox(width: 6),
                Text("128")
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: Theme.of(context).textTheme.labelSmall,
            ),
            onPressed: () {
              showModalBottomSheet(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                ),
                context: context,
                isScrollControlled: true,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                builder: (context) {
                  return DraggableScrollableSheet(
                    maxChildSize: 0.85,
                    initialChildSize: 0.7,
                    minChildSize: 0.6,
                    expand: false,
                    builder: (context, controller) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: GestureDetector(
                          onTap: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: SafeArea(
                            top: false,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BoxTitle("评论",
                                      padding: EdgeInsets.zero),
                                  const SizedBox(height: 20),
                                  Expanded(
                                    child: CustomScrollView(
                                      controller: controller,
                                      physics: const BottomModalScrollPhysics(),
                                      slivers: [
                                        SliverSafeArea(
                                          top: false,
                                          sliver:
                                              SliverList.list(children: const [
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                            Comment(),
                                          ]),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: TextField(
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                      cursorHeight: 20,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                        filled: true,
                                        hintText: "输入评论内容",
                                        constraints:
                                            const BoxConstraints(maxHeight: 44),
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        fillColor: iGrey1,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
            child: const Row(
              children: [
                Icon(Icons.comment_outlined, size: 20, color: Colors.white),
                SizedBox(width: 6),
                Text("128")
              ],
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: Theme.of(context).textTheme.labelSmall,
            ),
            onPressed: () {},
            child: const Row(
              children: [
                Icon(Icons.bookmark_add_outlined,
                    size: 20, color: Colors.white),
                SizedBox(width: 6),
                Text("82")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Comment extends StatelessWidget {
  const Comment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 38,
          height: 38,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(38),
            child: Image.network(
                "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/christopher-campbell-rDEOVtE7vOs-unsplash.jpg",
                fit: BoxFit.cover),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Stacia Keyna",
                  style: Theme.of(context).textTheme.labelSmall),
              const SizedBox(height: 4),
              const Text(
                  "SI absolutely love the winter season and the beauty of a snow-covered landscape. It's like walking in a fairy tale! ✨"),
              const SizedBox(height: 8),
            ],
          ),
        )
      ],
    );
  }
}

class BottomModalScrollPhysics extends ScrollPhysics {
  const BottomModalScrollPhysics({super.parent});

  @override
  BottomModalScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return BottomModalScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    final direction = position.axisDirection;
    if (direction == AxisDirection.down) {
      if (value < position.pixels &&
          position.pixels <= position.minScrollExtent) {
        return value - position.pixels;
      }

      if (value < position.minScrollExtent &&
          position.minScrollExtent < position.pixels) {
        return value - position.minScrollExtent;
      }
    } else if (direction == AxisDirection.up) {
      if (position.maxScrollExtent <= position.pixels &&
          position.pixels < value) {
        return value - position.pixels;
      }

      if (position.pixels < position.maxScrollExtent &&
          position.maxScrollExtent < value) {
        return value - position.maxScrollExtent;
      }
    }
    if (parent != null) return super.applyBoundaryConditions(position, value);
    return 0.0;
  }
}
