import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:cookers_app/widgets/button.dart';
import 'package:cookers_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController mailContoller, passwordController;
  @override
  void initState() {
    mailContoller = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: context.mediaQueryWidth,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(46),
                bottomRight: Radius.circular(46),
              ),
              image: DecorationImage(
                image: AssetImage(
                  'assets/components/farm.png',
                ),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                Text(
                  'Future of Farming',
                  style: context.largerTextStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 12),
                Text(
                  'Making farming more efficient\nsustainable, and ready for the challenges of tomorrow',
                  style: context.smallTextStyle.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AuthTextField(
                  textEditingController: mailContoller,
                  hintText: 'Your mail',
                ),
                const SizedBox(height: 16),
                AuthTextField(
                  textEditingController: passwordController,
                  hintText: 'Your password',
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Forget password?',
                    style: context.mediumTextStyle.copyWith(
                      color: context.primaryColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          CustomButton(
            title: 'Login',
            onTap: () {},
            color: context.primaryColor,
            textStyle: context.mediumTextStyle.copyWith(
              color: Colors.white,
            ),
            width: 277,
          ),
          const SizedBox(height: 70),
        ],
      ),
    );
  }
}
