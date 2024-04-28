import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/home_button.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetConst.menuButton),
                Text(
                  'Hello Murad!',
                  style: context.largerTextStyle,
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeButton(
                  asset: AssetConst.humidityButton,
                  title: '2.41',
                  subtitle: 'humidity in the air',
                ),
                HomeButton(
                  asset: AssetConst.phButton,
                  title: '68m²',
                  subtitle: 'pH dəyəri',
                ),
                HomeButton(
                  asset: AssetConst.humidityButton,
                  title: '73%',
                  subtitle: 'Tempratur',
                ),
                HomeButton(
                  asset: AssetConst.humidityButton,
                  title: '73%',
                  subtitle: 'Qazlar',
                ),
              ],
            ),
            const SizedBox(height: 50),
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: context.primaryColor),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 17,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(AssetConst.flowerButton),
                      const SizedBox(width: 10),
                      Text(
                        'Humidity of the soil',
                        style: context.largeTextStyle.copyWith(
                          color: context.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '15%',
                    style: context.largerTextStyle,
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      value: 0.8,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'See more',
                        style: context.largeTextStyle.copyWith(
                          color: const Color(0xFF5E5E5E),
                        ),
                      ),
                      SvgPicture.asset(AssetConst.nextButton),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
