import '../home_nearby_page/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeNearbyPage extends StatefulWidget {
  const HomeNearbyPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeNearbyPageState createState() => HomeNearbyPageState();
}

class HomeNearbyPageState extends State<HomeNearbyPage>
    with AutomaticKeepAliveClientMixin<HomeNearbyPage> {
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
            return UserprofileItemWidget();
          },
        ),
      ),
    );
  }
}
