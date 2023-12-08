import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'code_screen_model.dart';
export 'code_screen_model.dart';

class CodeScreenWidget extends StatefulWidget {
  const CodeScreenWidget({super.key});

  @override
  _CodeScreenWidgetState createState() => _CodeScreenWidgetState();
}

class _CodeScreenWidgetState extends State<CodeScreenWidget> {
  late CodeScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CodeScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Enter Pin Code Below',
            style: FlutterFlowTheme.of(context).bodyMedium,
          ),
          actions: const [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Align(
          alignment: const AlignmentDirectional(0.00, -1.00),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Confirm your Code',
                      style: FlutterFlowTheme.of(context).headlineSmall,
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(44.0, 8.0, 44.0, 0.0),
                      child: Text(
                        'This code helps keep your account safe and secure.',
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodySmall,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: PinCodeTextField(
                        autoDisposeControllers: false,
                        appContext: context,
                        length: 6,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter',
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        enableActiveFill: false,
                        autoFocus: true,
                        enablePinAutofill: false,
                        errorTextSpace: 0.0,
                        showCursor: true,
                        cursorColor: FlutterFlowTheme.of(context).primary,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        pinTheme: PinTheme(
                          fieldHeight: 60.0,
                          fieldWidth: 60.0,
                          borderWidth: 2.0,
                          borderRadius: BorderRadius.circular(12.0),
                          shape: PinCodeFieldShape.box,
                          activeColor: FlutterFlowTheme.of(context).primary,
                          inactiveColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          activeFillColor: FlutterFlowTheme.of(context).primary,
                          inactiveFillColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          selectedFillColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        controller: _model.pinCodeController,
                        onChanged: (_) {},
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: _model.pinCodeControllerValidator
                            .asValidator(context),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 44.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    GoRouter.of(context).prepareAuthEvent();
                    final smsCodeVal = _model.pinCodeController!.text;
                    if (smsCodeVal.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Enter SMS verification code.'),
                        ),
                      );
                      return;
                    }
                    final phoneVerifiedUser = await authManager.verifySmsCode(
                      context: context,
                      smsCode: smsCodeVal,
                    );
                    if (phoneVerifiedUser == null) {
                      return;
                    }

                    context.goNamedAuth('DashboardScreen', context.mounted);
                  },
                  text: 'Verify code',
                  options: FFButtonOptions(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF355E76),
                    textStyle: FlutterFlowTheme.of(context).titleMedium,
                    elevation: 2.0,
                    borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
