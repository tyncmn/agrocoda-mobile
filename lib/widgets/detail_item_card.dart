import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';

class DetailItemCard extends StatelessWidget {
  final String item, result;
  const DetailItemCard({super.key, required this.item, required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: 180,
      decoration: BoxDecoration(
        border: Border.all(color: context.primaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item,
            style: context.mediumTextStyle,
          ),
          Text(
            result,
            style: context.mediumTextStyle,
          ),
        ],
      ),
    );
  }
}
