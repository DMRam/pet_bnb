import '/components/host_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'host_ads_widget.dart' show HostAdsWidget;
import 'package:flutter/material.dart';

class HostAdsModel extends FlutterFlowModel<HostAdsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarController;
  String? Function(BuildContext, String?)? searchBarControllerValidator;
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
    searchBarFocusNode?.dispose();
    searchBarController?.dispose();

    tabBarController?.dispose();
    hostNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
