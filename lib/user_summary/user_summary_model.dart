import '/flutter_flow/flutter_flow_util.dart';
import 'user_summary_widget.dart' show UserSummaryWidget;
import 'package:flutter/material.dart';

class UserSummaryModel extends FlutterFlowModel<UserSummaryWidget> {
  ///  Local state fields for this page.

  DateTime? startDatePageVar;

  DateTime? endDatePageVar;

  String petTypeSelected = 'No pet type selected';

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for RatingBar widget.
  double? ratingBarValue;
  // State field(s) for PetsName widget.
  FocusNode? petsNameFocusNode;
  TextEditingController? petsNameController;
  String? Function(BuildContext, String?)? petsNameControllerValidator;
  String? _petsNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    petsNameControllerValidator = _petsNameControllerValidator;
  }

  @override
  void dispose() {
    petsNameFocusNode?.dispose();
    petsNameController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
