import '../community_leaderboard_dark_page/widgets/usercardlist_item_widget.dart';
import '../community_leaderboard_dark_page/widgets/userprofilelist1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class CommunityLeaderboardDarkPage extends StatefulWidget {
  const CommunityLeaderboardDarkPage({Key? key})
      : super(
          key: key,
        );

  @override
  CommunityLeaderboardDarkPageState createState() =>
      CommunityLeaderboardDarkPageState();
}

class CommunityLeaderboardDarkPageState
    extends State<CommunityLeaderboardDarkPage>
    with AutomaticKeepAliveClientMixin<CommunityLeaderboardDarkPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                        style: theme.textTheme.headlineLarge,
                      ),
                      SizedBox(height: 22.v),
                      _buildUserCardList(context),
                      SizedBox(height: 29.v),
                      _buildUserProfileList(context),
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
  Widget _buildUserCardList(BuildContext context) {
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
            width: 37.0.h,
            child: Divider(
              height: 1.v,
              thickness: 1.v,
              color: appTheme.gray400,
              indent: 0.5.h,
              endIndent: 0.5.h,
            ),
          );
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return UsercardlistItemWidget();
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
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
          return Userprofilelist1ItemWidget();
        },
      ),
    );
  }
}
