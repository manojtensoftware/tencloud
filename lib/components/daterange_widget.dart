import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class DaterangeWidget extends StatefulWidget {
  DaterangeWidget({
    Key key,
    this.userdata,
  }) : super(key: key);

  final UsersRecord userdata;

  @override
  _DaterangeWidgetState createState() => _DaterangeWidgetState();
}

class _DaterangeWidgetState extends State<DaterangeWidget> {
  DateTime datePicked1;
  DateTime datePicked2;
  bool _loadingButton = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Material(
          color: Colors.transparent,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0),
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFFBC02D),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              border: Border.all(
                color: Color(0xFF020000),
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Text(
                                  'From :',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Text(
                                  dateTimeFormat('d/M/y', datePicked1),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 8, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked1 = date);
                                        },
                                        currentTime: getCurrentTimestamp,
                                      );
                                    },
                                    child: Icon(
                                      Icons.date_range_rounded,
                                      color: Color(0xFF080101),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Text(
                                  'To :',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    30, 10, 0, 0),
                                child: Text(
                                  dateTimeFormat('d/M/y', datePicked2),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10, 8, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await DatePicker.showDatePicker(
                                        context,
                                        showTitleActions: true,
                                        onConfirm: (date) {
                                          setState(() => datePicked2 = date);
                                        },
                                        currentTime: getCurrentTimestamp,
                                      );
                                    },
                                    child: Icon(
                                      Icons.date_range_rounded,
                                      color: Color(0xFF080101),
                                      size: 24,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() => _loadingButton = true);
                              try {
                                final usersUpdateData = createUsersRecordData(
                                  fromDate: datePicked1,
                                  toDate: datePicked2,
                                );
                                await widget.userdata.reference
                                    .update(usersUpdateData);
                                Navigator.pop(context);
                              } finally {
                                setState(() => _loadingButton = false);
                              }
                            },
                            text: 'Set',
                            options: FFButtonOptions(
                              width: 80,
                              height: 30,
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
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
