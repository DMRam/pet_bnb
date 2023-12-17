import '/components/host_nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'host_messages_widget.dart' show HostMessagesWidget;
import 'package:flutter/material.dart';

class HostMessagesModel extends FlutterFlowModel<HostMessagesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
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
    hostNavBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
