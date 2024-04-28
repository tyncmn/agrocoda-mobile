import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:cookers_app/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class EntryView extends StatelessWidget {
  const EntryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primaryColor,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 180),
              SvgPicture.asset('assets/components/entry.svg'),
              const SizedBox(height: 10),
              Text(
                'ECHRON',
                style: context.headerTitleStyle,
              ),
              const SizedBox(height: 80),
              const Text(
                'Welcome to the ECHRON !',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              CustomButton(
                width: 220,
                title: 'Get Started',
                onTap: () => context.router.replaceNamed('/login'),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
