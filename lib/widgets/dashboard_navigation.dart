import 'package:auto_route/auto_route.dart';
import 'package:cookers_app/router/auto_router.dart';
import 'package:cookers_app/utils/extension.dart';
import 'package:flutter/material.dart';

/// Dashboard navigation button widget
/// Add this to any screen where you want to provide access to the dashboard
class DashboardNavigationButton extends StatelessWidget {
  const DashboardNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.router.push(const DashboardRoute());
      },
      icon: const Icon(Icons.dashboard_outlined, size: 20),
      label: const Text('Open Dashboard'),
      style: ElevatedButton.styleFrom(
        backgroundColor: context.primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

/// Floating action button for dashboard access
class DashboardFAB extends StatelessWidget {
  const DashboardFAB({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.router.push(const DashboardRoute());
      },
      backgroundColor: context.primaryColor,
      child: const Icon(Icons.analytics_outlined, color: Colors.white),
    );
  }
}

/// Dashboard card widget for home screen
/// Shows a preview card that navigates to full dashboard when tapped
class DashboardPreviewCard extends StatelessWidget {
  const DashboardPreviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(const DashboardRoute());
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: context.primaryColor),
          gradient: LinearGradient(
            colors: [
              context.primaryColor.withOpacity(0.1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.analytics_outlined,
                color: Colors.white,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Agrocoda Dashboard',
                    style: context.largeTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'View real-time sensor data & AI insights',
                    style: context.smallTextStyle.copyWith(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: context.primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
