import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'host_create_widget.dart' show HostCreateWidget;
import 'package:flutter/material.dart';

class HostCreateModel extends FlutterFlowModel<HostCreateWidget> {
  ///  Local state fields for this component.

  String adOwnerId = '';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (Geocode API)] action in Column widget.
  ApiCallResponse? apiResult6k0;
  // State field(s) for hostAddress widget.
  FocusNode? hostAddressFocusNode;
  TextEditingController? hostAddressController;
  String? Function(BuildContext, String?)? hostAddressControllerValidator;
  // Stores action output result for [Backend Call - API (Geocode API)] action in hostAddress widget.
  ApiCallResponse? apiResult9w1;
  // Stores action output result for [Backend Call - API (Geocode API)] action in Button widget.
  ApiCallResponse? apiResultr9w;
  // State field(s) for DropDownCategory widget.
  String? dropDownCategoryValue;
  FormFieldController<String>? dropDownCategoryValueController;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    hostAddressFocusNode?.dispose();
    hostAddressController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
