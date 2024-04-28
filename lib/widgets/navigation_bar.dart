import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum NavigationBarItem { home, cencor, map, profile }

typedef OnNavigationItemTapped = void Function(NavigationBarItem item);

class CustomNavigationBar extends StatefulWidget {
  final OnNavigationItemTapped onNavigationItemTapped;

  const CustomNavigationBar({
    super.key,
    required this.onNavigationItemTapped,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  NavigationBarItem _selectedItem = NavigationBarItem.home;

  void _onNavigationItemTapped(NavigationBarItem item) {
    widget.onNavigationItemTapped(item);
    setState(() {
      _selectedItem = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75 + MediaQuery.of(context).padding.bottom,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        border: const Border(
          top: BorderSide(
            color: Color(0xFFE3E3E3),
            width: 1.5,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            isActive: _selectedItem == NavigationBarItem.home,
            icon: 'assets/components/home.svg',
            onPressed: () => _onNavigationItemTapped(NavigationBarItem.home),
          ),
          _NavItem(
            isActive: _selectedItem == NavigationBarItem.cencor,
            icon: 'assets/components/thermometer.svg',
            onPressed: () => _onNavigationItemTapped(NavigationBarItem.cencor),
          ),
          _NavItem(
            isActive: _selectedItem == NavigationBarItem.profile,
            icon: 'assets/components/user.svg',
            onPressed: () => _onNavigationItemTapped(NavigationBarItem.profile),
          )
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    this.onPressed,
    required this.isActive,
  });

  final String icon;
  final void Function()? onPressed;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : Colors.transparent,
        ),
        child: SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(
            isActive ? const Color(0xFF191919) : const Color(0xFFF7F7F7),
            BlendMode.srcIn,
          ),
          height: 28,
        ),
      ),
    );
  }
}
