import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RecieptcompoWidget extends StatefulWidget {
  RecieptcompoWidget({
    Key key,
    this.acid,
    this.billinfo,
    this.dbase,
  }) : super(key: key);

  final int acid;
  final dynamic billinfo;
  final String dbase;

  @override
  _RecieptcompoWidgetState createState() => _RecieptcompoWidgetState();
}

class _RecieptcompoWidgetState extends State<RecieptcompoWidget> {
  TextEditingController textController1;
  TextEditingController textController2;
  bool tilecashValue;
  bool _loadingButton = false;

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController();
    textController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 3, 0, 0),
                  child: Text(
                    'Reciept Entry',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xFFF20A0A),
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.7, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Invoice No:${getJsonField(widget.billinfo, r'''$..inv_no''').toString()}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: AlignmentDirectional(-0.65, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Text(
                        'Balance Due: ${getJsonField(widget.billinfo, r'''$..due''').toString()}',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 50, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                      child: TextFormField(
                        controller: textController1,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Recieved Amount',
                          labelStyle: FlutterFlowTheme.bodyText1,
                          hintText: 'Amount',
                          hintStyle: FlutterFlowTheme.bodyText1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.tertiaryColor,
                        ),
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 50, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 5, 0),
                      child: TextFormField(
                        controller: textController2,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Ref',
                          labelStyle: FlutterFlowTheme.bodyText1,
                          hintText: 'Ref No',
                          hintStyle: FlutterFlowTheme.bodyText1,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: FlutterFlowTheme.primaryColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: FlutterFlowTheme.tertiaryColor,
                        ),
                        style: FlutterFlowTheme.bodyText1,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 50, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 30, 0),
                      child: SwitchListTile(
                        value: tilecashValue ??= true,
                        onChanged: (newValue) =>
                            setState(() => tilecashValue = newValue),
                        title: Text(
                          'Cash',
                          style: FlutterFlowTheme.title3,
                        ),
                        tileColor: Color(0xFFF5F5F5),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      setState(() => _loadingButton = true);
                      try {
                        await recieptCall(
                          stype: 'INSERT',
                          dbase: widget.dbase,
                          mobile: functions.mobilenoformat(currentPhoneNumber),
                          amount: double.parse(textController1.text),
                          pid: widget.acid,
                          cash: functions.convertbooltoint(tilecashValue),
                          bill: getJsonField(widget.billinfo, r'''$..inv_no''')
                              .toString(),
                          refno: textController2.text,
                        );
                        Navigator.pop(context);
                      } finally {
                        setState(() => _loadingButton = false);
                      }
                    },
                    text: 'Save',
                    options: FFButtonOptions(
                      width: 130,
                      height: 40,
                      color: FlutterFlowTheme.primaryColor,
                      textStyle: FlutterFlowTheme.subtitle2.override(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                      ),
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 12,
                    ),
                    loading: _loadingButton,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
