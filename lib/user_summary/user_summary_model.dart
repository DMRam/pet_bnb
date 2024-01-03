import '/flutter_flow/flutter_flow_util.dart';
import 'user_summary_widget.dart' show UserSummaryWidget;
import 'package:flutter/material.dart';

class UserSummaryModel extends FlutterFlowModel<UserSummaryWidget> {
  ///  Local state fields for this page.

  DateTime? startDatePageVar;

  DateTime? endDatePageVar;

  String petTypeSelected = 'No pet type selected';

  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
