import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileBigCard extends StatelessWidget {
  const ProfileBigCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      height: 105,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFF25A047),
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            width: 74,
            height: 74,
            decoration: BoxDecoration(
              color: context.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Murad Ibish',
                  style: context.largeTextStyle,
                ),
                const Spacer(),
                Text(
                  '22ha field',
                  style: context.smallTextStyle,
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: SvgPicture.asset('assets/components/qr.svg'),
          ),
        ],
      ),
    );
  }
}
