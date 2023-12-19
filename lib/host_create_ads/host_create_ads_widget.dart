import '/components/host_create_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'host_create_ads_model.dart';
export 'host_create_ads_model.dart';

class HostCreateAdsWidget extends StatefulWidget {
  const HostCreateAdsWidget({super.key});

  @override
  _HostCreateAdsWidgetState createState() => _HostCreateAdsWidgetState();
}

class _HostCreateAdsWidgetState extends State<HostCreateAdsWidget> {
  late HostCreateAdsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HostCreateAdsModel());

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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            const Column(
              mainAxisSize: MainAxisSize.max,
              children: [],
            ),
            wrapWithModel(
              model: _model.hostCreateModel,
              updateCallback: () => setState(() {}),
              child: const HostCreateWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
