import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';
import 'package:savorsipv2/presentation/community_friends_page/community_friends_page.dart';
import 'package:savorsipv2/presentation/community_leaderboard_dark_page/community_leaderboard_dark_page.dart';

// ignore_for_file: must_be_immutable
class CommunityFriendsDarkTabContainerPage extends StatefulWidget {
  const CommunityFriendsDarkTabContainerPage({Key? key})
      : super(
          key: key,
        );

  @override
  CommunityFriendsDarkTabContainerPageState createState() =>
      CommunityFriendsDarkTabContainerPageState();
}

class CommunityFriendsDarkTabContainerPageState
    extends State<CommunityFriendsDarkTabContainerPage>
    with TickerProviderStateMixin {
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
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlack,
          child: Column(
            children: [
              _buildTabview(context),
              Expanded(
                child: SizedBox(
                  height: 765.v,
                  child: TabBarView(
                    controller: tabviewController,
                    children: [
                      CommunityLeaderboardDarkPage(),
                      CommunityFriendsPage(),
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
        labelColor: appTheme.black900,
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
              "Leaderboard",
            ),
          ),
          Tab(
            child: Text(
              "Friends List",
            ),
          ),
        ],
      ),
    );
  }
}
