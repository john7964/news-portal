import 'package:flutter/material.dart';

class BoxTitle extends StatelessWidget {
  const BoxTitle(this.text, {super.key, required this.padding});

  final EdgeInsets padding;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineLarge,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class SliverTitle extends StatelessWidget {
  const SliverTitle(this.text, {super.key, required this.padding});

  final String text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        padding: padding,
        child: Row(
          children: [
            Text(text,
                style: Theme.of(context).textTheme.headlineLarge,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
