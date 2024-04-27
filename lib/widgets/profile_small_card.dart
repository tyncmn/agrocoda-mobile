import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSmallCard extends StatelessWidget {
  final String asset, title;
  const ProfileSmallCard({super.key, required this.asset, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF25A047),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.only(
        left: 26,
        top: 18,
        bottom: 18,
        right: 15,
      ),
      height: 64,
      child: Row(
        children: [
          SvgPicture.asset(asset),
          const SizedBox(width: 24),
          Text(
            title,
            style: context.mediumTextStyle,
          ),
          const Spacer(),
          SvgPicture.asset(
            AssetConst.nextButton,
          ),
        ],
      ),
    );
  }
}
