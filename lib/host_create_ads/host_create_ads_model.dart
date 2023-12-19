import '/components/host_create_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'host_create_ads_widget.dart' show HostCreateAdsWidget;
import 'package:flutter/material.dart';

class HostCreateAdsModel extends FlutterFlowModel<HostCreateAdsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for HostCreate component.
  late HostCreateModel hostCreateModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    hostCreateModel = createModel(context, () => HostCreateModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    hostCreateModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
