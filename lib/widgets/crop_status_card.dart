import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CropStatusCard extends StatelessWidget {
  final String cropStatus, result, asset;
  const CropStatusCard({
    super.key,
    required this.cropStatus,
    required this.result,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                asset,
                width: 21,
                height: 21,
                colorFilter: const ColorFilter.mode(
                  Colors.black,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                cropStatus,
                style: context.smallTextStyle,
              ),
              const Spacer(),
              Text(
                result,
                style: context.smallTextStyle,
              ),
            ],
          ),
          const SizedBox(height: 1),
          Container(
            color: context.primaryColor,
            height: 1,
          ),
        ],
      ),
    );
  }
}
