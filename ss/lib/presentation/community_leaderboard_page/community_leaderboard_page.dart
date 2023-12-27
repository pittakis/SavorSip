import '../community_leaderboard_page/widgets/leaderboardrestlist_item_widget.dart';
import '../community_leaderboard_page/widgets/userprofilelist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CommunityLeaderboardPage extends StatefulWidget {
  const CommunityLeaderboardPage({Key? key})
      : super(
          key: key,
        );

  @override
  CommunityLeaderboardPageState createState() =>
      CommunityLeaderboardPageState();
}

class CommunityLeaderboardPageState extends State<CommunityLeaderboardPage>
    with AutomaticKeepAliveClientMixin<CommunityLeaderboardPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 19.v),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.h),
                  child: Column(
                    children: [
                      Text(
                        "Who is More of a DRUNK?",
                        style: CustomTextStyles.headlineLargeSecondaryContainer,
                      ),
                      SizedBox(height: 22.v),
                      _buildUserProfileList(context),
                      SizedBox(height: 29.v),
                      _buildLeaderboardRestList(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return SizedBox(
      height: 165.v,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            width: 60.0.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.gray400,
              indent: 12.0.h,
              endIndent: 12.0.h,
            ),
          );
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          return UserprofilelistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildLeaderboardRestList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 5.v,
          );
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return LeaderboardrestlistItemWidget();
        },
      ),
    );
  }
}
