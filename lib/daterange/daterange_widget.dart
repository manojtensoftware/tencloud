import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class DaterangeWidget extends StatefulWidget {
  DaterangeWidget({Key key}) : super(key: key);

  @override
  _DaterangeWidgetState createState() => _DaterangeWidgetState();
}

class _DaterangeWidgetState extends State<DaterangeWidget> {
  DateTime datePicked1;
  DateTime datePicked2;
  bool _loadingButton = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) =>
              usersRecord.where('uid', isEqualTo: currentUserUid),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: Color(0xFFFBC02D),
                ),
              ),
            );
          }
          List<UsersRecord> daterangeUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final daterangeUsersRecord = daterangeUsersRecordList.isNotEmpty
              ? daterangeUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: Color(0xFFFBC02D),
            body: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Text(
                          'Set Period',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.93,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xE6000000),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        'From',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat('d/M/y',
                                            daterangeUsersRecord.fromDate),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFBC02D),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 10, 0, 0),
                                      child: Text(
                                        'To',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        dateTimeFormat('d/M/y',
                                            daterangeUsersRecord.toDate),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFBC02D),
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: FaIcon(
                                        FontAwesomeIcons.calendarAlt,
                                        color: Color(0xFFFBC02D),
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await DatePicker.showDatePicker(
                                          context,
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            setState(() => datePicked1 = date);
                                          },
                                          currentTime:
                                              daterangeUsersRecord.fromDate,
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 30,
                                      borderWidth: 1,
                                      buttonSize: 60,
                                      icon: Icon(
                                        Icons.calendar_today_sharp,
                                        color: Color(0xFFFBC02D),
                                        size: 30,
                                      ),
                                      onPressed: () async {
                                        await DatePicker.showDatePicker(
                                          context,
                                          showTitleActions: true,
                                          onConfirm: (date) {
                                            setState(() => datePicked2 = date);
                                          },
                                          currentTime:
                                              daterangeUsersRecord.toDate,
                                        );
                                      },
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            setState(() => _loadingButton = true);
                            try {
                              final usersUpdateData = createUsersRecordData(
                                fromDate: datePicked1,
                                toDate: datePicked2,
                              );
                              await daterangeUsersRecord.reference
                                  .update(usersUpdateData);
                              Navigator.pop(context);
                            } finally {
                              setState(() => _loadingButton = false);
                            }
                          },
                          text: 'Set',
                          options: FFButtonOptions(
                            width: 130,
                            height: 40,
                            color: Color(0xE6000000),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFFBC02D),
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
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
