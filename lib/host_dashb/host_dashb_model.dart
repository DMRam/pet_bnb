import '/components/host_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'host_dashb_widget.dart' show HostDashbWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HostDashbModel extends FlutterFlowModel<HostDashbWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Carousel widget.
  CarouselController? carouselController1;

  int carouselCurrentIndex1 = 1;

  // State field(s) for RatingBar widget.
  double? ratingBarValue1;
  // State field(s) for Carousel widget.
  CarouselController? carouselController2;

  int carouselCurrentIndex2 = 1;

  // State field(s) for RatingBar widget.
  double? ratingBarValue2;
  // State field(s) for Carousel widget.
  CarouselController? carouselController3;

  int carouselCurrentIndex3 = 1;

  // State field(s) for RatingBar widget.
  double? ratingBarValue3;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for HostNavBar component.
  late HostNavBarModel hostNavBarModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hostNavBarModel = createModel(context, () => HostNavBarModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    hostNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
