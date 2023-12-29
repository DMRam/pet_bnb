import '/components/dates_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'user_date_picker_widget.dart' show UserDatePickerWidget;
import 'package:flutter/material.dart';

class UserDatePickerModel extends FlutterFlowModel<UserDatePickerWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for Dates component.
  late DatesModel datesModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    datesModel = createModel(context, () => DatesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    datesModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
