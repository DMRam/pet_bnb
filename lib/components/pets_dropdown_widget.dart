import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pets_dropdown_model.dart';
export 'pets_dropdown_model.dart';

class PetsDropdownWidget extends StatefulWidget {
  const PetsDropdownWidget({
    super.key,
    this.parameter1,
  });

  final List<String>? parameter1;

  @override
  _PetsDropdownWidgetState createState() => _PetsDropdownWidgetState();
}

class _PetsDropdownWidgetState extends State<PetsDropdownWidget> {
  late PetsDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PetsDropdownModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Form(
      key: _model.formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
        child: FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= 'None',
          ),
          options: widget.parameter1!,
          onChanged: (val) async {
            setState(() => _model.dropDownValue = val);
            _model.updatePage(() {
              FFAppState().petSelected = _model.dropDownValue!;
            });
          },
          width: 300.0,
          height: 50.0,
          textStyle: FlutterFlowTheme.of(context).bodyMedium,
          hintText: 'Please select...',
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 24.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: FlutterFlowTheme.of(context).alternate,
          borderWidth: 2.0,
          borderRadius: 8.0,
          margin: const EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
          hidesUnderline: true,
          isOverButton: true,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ),
    );
  }
}
