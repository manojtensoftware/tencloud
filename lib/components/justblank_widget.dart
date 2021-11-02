import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JustblankWidget extends StatefulWidget {
  JustblankWidget({Key key}) : super(key: key);

  @override
  _JustblankWidgetState createState() => _JustblankWidgetState();
}

class _JustblankWidgetState extends State<JustblankWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Calculating...',
            style: FlutterFlowTheme.bodyText1.override(
              fontFamily: 'Poppins',
              color: FlutterFlowTheme.primaryColor,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }
}
