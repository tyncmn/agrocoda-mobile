import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/controllers/controllers.dart';
import 'package:cookers_app/models/request.dart';
import 'package:cookers_app/router/auto_router.gr.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:cookers_app/view/add_cencor_view.dart';
import 'package:cookers_app/widgets/button.dart';
import 'package:cookers_app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userIdProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late final TextEditingController mailContoller, passwordController;
  @override
  void initState() {
    mailContoller = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginController, (previous, next) {
      next.when(
        data: (value) {
          ref.read(userIdProvider.notifier).state =
              int.parse(mailContoller.text);
          if (value.fields.isEmpty) {
            context.router.replaceAll([
              const MainRoute(),
              const AddCencorRoute(),
            ]);
          } else {
            final deviceId = value.fields.first.device;
            ref.read(deviceIdProvider.notifier).state = deviceId;
            context.router.pushNamed('/main');
          }
        },
        loading: () {},
        error: (error, stack) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Something went wrong! Please try again."),
            ),
          );
        },
      );
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
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
                    style:
                        context.largerTextStyle.copyWith(color: Colors.white),
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
                    hintText: 'Your ID',
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
            SizedBox(
              height: context.dynamicHeight(0.2),
            ),
            CustomButton(
              title: 'Login',
              onTap: () {
                final request = LoginRequest(
                  id: int.tryParse(mailContoller.text) ?? 0,
                  password: passwordController.text,
                );
                ref.read(loginController.notifier).login(request);
              },
              color: context.primaryColor,
              textStyle: context.mediumTextStyle.copyWith(
                color: Colors.white,
              ),
              width: 277,
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
