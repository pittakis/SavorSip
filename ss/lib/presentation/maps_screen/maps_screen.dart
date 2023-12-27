import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:savorsipv2/core/app_export.dart';

// ignore_for_file: must_be_immutable
class MapsScreen extends StatelessWidget {
  MapsScreen({Key? key}) : super(key: key);

  Completer<GoogleMapController> googleMapController = Completer();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA700,
            body: SizedBox(
                width: double.maxFinite,
                child: SingleChildScrollView(
                    child: Container(
                        height: SizeUtils.height,
                        width: double.maxFinite,
                        margin: EdgeInsets.only(bottom: 1.v),
                        child: Stack(alignment: Alignment.topLeft, children: [
                          _buildMapSection(context),
                          CustomImageView(
                              imagePath: ImageConstant.imgArrowLeftBlueGray900,
                              height: 20.adaptSize,
                              width: 20.adaptSize,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 10.v),
                              onTap: () {
                                onTapImgArrowLeft(context);
                              })
                        ]))))));
  }

  /// Section Widget
  Widget _buildMapSection(BuildContext context) {
    return SizedBox(
        height: 845.v,
        width: 380.h,
        child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(37.43296265331129, -122.08832357078792),
                zoom: 14.4746),
            onMapCreated: (GoogleMapController controller) {
              googleMapController.complete(controller);
            },
            zoomControlsEnabled: false,
            zoomGesturesEnabled: false,
            myLocationButtonEnabled: false,
            myLocationEnabled: false));
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
