import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/assets_const.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:cookers_app/widgets/profile_big_card.dart';
import 'package:cookers_app/widgets/profile_small_card.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<String> assets = [
    AssetConst.historyButton,
    AssetConst.lanButton,
    AssetConst.helpButton,
    AssetConst.referButton,
    AssetConst.feedbackButton,
  ];
  final List<String> titles = [
    'History',
    'Language',
    'Help',
    'Refer a friend',
    'Feedback',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 17),
              Text(
                'My Profile',
                style: context.largerTextStyle,
              ),
              const SizedBox(height: 30),
              const ProfileBigCard(),
              const SizedBox(height: 30),
              ...List.generate(
                5,
                (index) => ProfileSmallCard(
                  asset: assets[index],
                  title: titles[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
