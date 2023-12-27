import '../home_friends_page/widgets/userprofile1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeFriendsPage extends StatefulWidget {
  const HomeFriendsPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeFriendsPageState createState() => HomeFriendsPageState();
}

class HomeFriendsPageState extends State<HomeFriendsPage>
    with AutomaticKeepAliveClientMixin<HomeFriendsPage> {
  @override
  bool get wantKeepAlive => true;
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
              SizedBox(height: 10.v),
              _buildUserProfile(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 16.v,
            );
          },
          itemCount: 2,
          itemBuilder: (context, index) {
            return Userprofile1ItemWidget();
          },
        ),
      ),
    );
  }
}
