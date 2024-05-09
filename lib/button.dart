import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(4, 4, 12, 4),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: iGrey1,
              borderRadius: BorderRadius.circular(16),
            ),
            width: 32,
            height: 32,
            child:  Icon(icon, size: 18, color: blue1),
          ),
          const SizedBox(width: 6),
           Text(text)
        ],
      ),
    );
  }
}