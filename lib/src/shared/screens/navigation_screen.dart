import 'package:appsilon/src/routing/app_router.dart';
import 'package:appsilon/src/themes/app_color.dart';
import 'package:appsilon/src/themes/app_size.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declared as children
      // routes of /dashboard
      routes: const [
        HomeRoute(),
        ReportRoute(),
        SubscriptionRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        // the passed child is technically our animated selected-tab page
        child: child,
      ),
      builder: (context, child) {
        // obtain the scoped TabsRouter controller using context
        final tabsRouter = AutoTabsRouter.of(context);
        // Here we're building our Scaffold inside of AutoTabsRouter
        // to access the tabsRouter controller provided in this context
        //
        //alterntivly you could use a global key
        return Scaffold(
          body: child,
          bottomNavigationBar: DotNavigationBar(
            selectedItemColor: AppColor.lightBlue,
            marginR: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingMedium,
                vertical: AppSize.paddingMini),
            paddingR: const EdgeInsets.symmetric(
                horizontal: AppSize.paddingRegular,
                vertical: AppSize.borderRadiusRegular),
            enablePaddingAnimation: false,
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            items: [
              DotNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/home.svg')),
              DotNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/report.svg')),
              DotNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/user.svg')),
              DotNavigationBarItem(
                  icon: SvgPicture.asset('assets/icons/settings.svg')),
            ],
          ),
        );
      },
    );
  }
}
