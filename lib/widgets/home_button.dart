import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButton extends StatelessWidget {
  final String asset, title, subtitle;
  const HomeButton({
    super.key,
    required this.asset,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(height: 9),
          Text(
            title,
            style: context.largeTextStyle,
          ),
          Text(
            subtitle,
            style: context.smallTextStyle.copyWith(
              color: const Color(0xFFB3B3B3),
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
