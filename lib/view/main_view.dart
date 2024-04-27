import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/router/auto_router.gr.dart';
import 'package:cookers_app/widgets/navigation_bar.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        CencorRoute(),
        MapRoute(),
        ProfileRoute(),
      ],
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (context, child, animation) {
        double beginRadius = 0;
        double endRadius = height * 1.3;

        Tween<double> radiusTween = Tween<double>(
          begin: beginRadius,
          end: endRadius,
        );
        final radiusTweenAnimation = animation.drive(radiusTween);

        Tween<double> scaleTween = Tween<double>(
          begin: 0.9,
          end: 1,
        );
        final scaleTweenAnimation = animation.drive(scaleTween);

        final centerCircleOffset = Offset(
          context.tabsRouter.activeIndex * (width / 5),
          height,
        );
        return ClipPath(
          clipper: CircleTransitionClipper(
            center: centerCircleOffset,
            radius: radiusTweenAnimation.value,
          ),
          child: Transform.scale(
            scale: scaleTweenAnimation.value,
            origin: centerCircleOffset,
            alignment: Alignment.bottomCenter,
            child: child,
          ),
        );
      },
      builder: (
        context,
        child,
      ) {
        final tabsRouter = context.tabsRouter;
        return Scaffold(
          extendBody: true,
          bottomNavigationBar: CustomNavigationBar(
            onNavigationItemTapped: (item) {
              tabsRouter.setActiveIndex(item.index);
            },
          ),
          body: SafeArea(child: child),
        );
      },
    );
  }
}

class CircleTransitionClipper extends CustomClipper<Path> {
  CircleTransitionClipper({
    required this.center,
    required this.radius,
  });

  final Offset center;
  final double radius;

  @override
  Path getClip(Size size) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(CircleTransitionClipper oldClipper) => true;
}
