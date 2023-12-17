import '/flutter_flow/flutter_flow_util.dart';
import 'host_pet_details_widget.dart' show HostPetDetailsWidget;
import 'package:flutter/material.dart';

class HostPetDetailsModel extends FlutterFlowModel<HostPetDetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
