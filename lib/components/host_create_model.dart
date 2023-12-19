import '/flutter_flow/flutter_flow_util.dart';
import 'host_create_widget.dart' show HostCreateWidget;
import 'package:flutter/material.dart';

class HostCreateModel extends FlutterFlowModel<HostCreateWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  // State field(s) for projectURL widget.
  FocusNode? projectURLFocusNode;
  TextEditingController? projectURLController;
  String? Function(BuildContext, String?)? projectURLControllerValidator;
  // State field(s) for clonableURL widget.
  FocusNode? clonableURLFocusNode;
  TextEditingController? clonableURLController;
  String? Function(BuildContext, String?)? clonableURLControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();

    projectURLFocusNode?.dispose();
    projectURLController?.dispose();

    clonableURLFocusNode?.dispose();
    clonableURLController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
