import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_portal/views/news_view.dart';

class NewsStackCard extends StatelessWidget {
  const NewsStackCard(
      {super.key,
      this.padding,
      this.top,
      this.simple = true,
      this.borderRadius});

  final EdgeInsets? padding;
  final double? top;
  final bool simple;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context, rootNavigator: true)
          .push(MaterialPageRoute(builder: (context) => const NewsView())),
      child: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: borderRadius ?? BorderRadius.zero,
            child: CachedNetworkImage(
              imageUrl: simple
                  ? "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/olga-ga-IQMCYVVa2Wc-unsplash.jpg"
                  : "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/maarten-duineveld-pmfJcN7RGiw-unsplash.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(9, 21, 30, 0),
                  Color.fromRGBO(9, 21, 30, 0.7)
                ],
                stops: [0.0, 0.62],
              ),
            ),
          ),
          Positioned(
            top: (top ?? 0) + MediaQuery.of(context).viewPadding.top,
            bottom: 0,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: padding ?? const EdgeInsets.all(16),
                child: Wrap(
                  runSpacing: 12,
                  clipBehavior: Clip.hardEdge,
                  direction: Axis.horizontal,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    if (!simple)
                      const Text("March 29, 2023 · 2mins read · Sport",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 0.72))),
                    Text(
                        "From slope to citybreak: enjoy skiing and sightseeing in Innsbruck",
                        style: (simple
                                ? Theme.of(context).textTheme.headlineMedium
                                : Theme.of(context).textTheme.displaySmall)!
                            .copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true),
                    if (simple)
                      const Text("March 29, 2023 · 2mins read · Sport",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 0.72))),
                    if (!simple)
                      const Text(
                        "Snow covers the world, creates a winter wonderland, and benefits the environment.",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(255, 255, 255, 0.72)),
                      ),
                    if (!simple)
                      Row(
                        children: [
                          SizedBox(
                            height: 28,
                            width: 28,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              child: CachedNetworkImage(
                                imageUrl:
                                    "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/maarten-duineveld-pmfJcN7RGiw-unsplash.jpg",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            "By Stacia Keyna",
                            style: TextStyle(
                                fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.72)),
                          ),
                        ],
                      )
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

class NewsVerticalCard extends StatelessWidget {
  const NewsVerticalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context, rootNavigator: true)
          .push(MaterialPageRoute(builder: (context) => const NewsView())),
      child: SizedBox(
        width: 260,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 260,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/maarten-duineveld-pmfJcN7RGiw-unsplash.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text("Snow Blankets the Sky, Creating a Winter Wonderland",
                style: Theme.of(context).textTheme.headlineSmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            const SizedBox(height: 6),
            Text("Stacia Key.",
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}

class NewsHorizontalCard extends StatelessWidget {
  const NewsHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context, rootNavigator: true)
          .push(MaterialPageRoute(builder: (context) => const NewsView())),
      child: Row(
        children: [
          SizedBox(
            width: 86,
            height: 86,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    "https://sunivers-erp.oss-cn-shenzhen.aliyuncs.com/dev/front/app/image/ann-danilina-zgohOdeKpnA-unsplash.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The tricks to induce lucid dreams",
                    style: Theme.of(context).textTheme.headlineMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 12),
                Text("Stacia Key. · 2 mins read",
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
