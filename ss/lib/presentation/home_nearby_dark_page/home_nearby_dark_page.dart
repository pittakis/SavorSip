import '../home_nearby_dark_page/widgets/userprofile3_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class HomeNearbyDarkPage extends StatefulWidget {
  const HomeNearbyDarkPage({Key? key})
      : super(
          key: key,
        );

  @override
  HomeNearbyDarkPageState createState() => HomeNearbyDarkPageState();
}

class HomeNearbyDarkPageState extends State<HomeNearbyDarkPage>
    with AutomaticKeepAliveClientMixin<HomeNearbyDarkPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillBlack,
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
            return Userprofile3ItemWidget();
          },
        ),
      ),
    );
  }
}
