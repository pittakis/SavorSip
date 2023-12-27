import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/presentation/home_nearby_dark_page/home_nearby_dark_page.dart';
import 'package:savorsipv2/presentation/home_nearby_page/home_nearby_page.dart';

// ignore_for_file: must_be_immutable
class HomeFriendsTabContainerPage extends StatefulWidget {
  const HomeFriendsTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeFriendsTabContainerPageState createState() =>
      HomeFriendsTabContainerPageState();
}

class HomeFriendsTabContainerPageState
    extends State<HomeFriendsTabContainerPage> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.background,
          child: Column(
            children: [
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 765.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      HomeNearbyDarkPage(),
                      HomeNearbyPage(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 32.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
      ),
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.whiteA700,
        labelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelColor: theme.colorScheme.primary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
        indicator: BoxDecoration(
          border: Border.all(
            color: appTheme.black900,
            width: 2.h,
          ),
        ),
        tabs: [
          Tab(
            child: Text(
              "Nearby Ratings",
            ),
          ),
          Tab(
            child: Text(
              "Friend Ratings",
            ),
          ),
        ],
      ),
    );
  }
}
