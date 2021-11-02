import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../userdetail/userdetail_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifystorecodeWidget extends StatefulWidget {
  VerifystorecodeWidget({Key key}) : super(key: key);

  @override
  _VerifystorecodeWidgetState createState() => _VerifystorecodeWidgetState();
}

class _VerifystorecodeWidgetState extends State<VerifystorecodeWidget> {
  TextEditingController textController;
  bool _loadingButton1 = false;
  dynamic clientInfo;
  bool _loadingButton2 = false;
  dynamic phonestatus;
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
          List<UsersRecord> verifystorecodeUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final verifystorecodeUsersRecord =
              verifystorecodeUsersRecordList.isNotEmpty
                  ? verifystorecodeUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                      child: Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFFBC02D),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.asset(
                                'assets/images/yellow_grunge_style_halftone_pattern_background.png',
                              ).image,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(0),
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            border: Border.all(
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'Verify Your Status',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xE6000000),
                                    fontSize: 18,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 10, 10, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 20, 0, 0),
                                        child: Text(
                                          functions.mobilenoformat(
                                              currentPhoneNumber),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xE6000000),
                                            fontSize: 18,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 40, 0, 0),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.93,
                                      height: 250,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.tertiaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Color(0xB3FBC02D),
                                          width: 1,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 10, 10, 10),
                                            child: TextFormField(
                                              controller: textController ??=
                                                  TextEditingController(
                                                text: verifystorecodeUsersRecord
                                                    .storeCode,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Store Code',
                                                labelStyle:
                                                    FlutterFlowTheme.bodyText1,
                                                hintText: 'Store Code',
                                                hintStyle:
                                                    FlutterFlowTheme.bodyText1,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  valueOrDefault<String>(
                                                    getJsonField(clientInfo,
                                                            r'''$..client_name''')
                                                        .toString(),
                                                    'Firm Name to be show here',
                                                  ),
                                                  style: FlutterFlowTheme
                                                      .bodyText1,
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton1 = true);
                                                try {
                                                  clientInfo =
                                                      await clientsinfoCall(
                                                    scode:
                                                        textController?.text ??
                                                            '',
                                                  );
                                                  final usersUpdateData =
                                                      createUsersRecordData(
                                                    dataid: getJsonField(
                                                        clientInfo,
                                                        r'''$..id'''),
                                                  );
                                                  await verifystorecodeUsersRecord
                                                      .reference
                                                      .update(usersUpdateData);

                                                  setState(() {});
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton1 = false);
                                                }
                                              },
                                              text: 'Verify',
                                              icon: Icon(
                                                Icons.verified_user,
                                                color: Color(0xFFFBC02D),
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Colors.black,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                              loading: _loadingButton1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 20, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton2 = true);
                                                try {
                                                  if ((verifystorecodeUsersRecord
                                                          .dataid) >
                                                      (0)) {
                                                    phonestatus =
                                                        await usersstatusCall(
                                                      dbase: getJsonField(
                                                              clientInfo,
                                                              r'''$..data_path''')
                                                          .toString(),
                                                      mobile: functions
                                                          .mobilenoformat(
                                                              currentPhoneNumber),
                                                    );
                                                  } else {
                                                    return;
                                                  }
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          UserdetailWidget(
                                                        storeinfo: clientInfo,
                                                        userinfo: phonestatus,
                                                      ),
                                                    ),
                                                  );

                                                  setState(() {});
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton2 = false);
                                                }
                                              },
                                              text: 'Next',
                                              icon: Icon(
                                                Icons.navigate_next,
                                                size: 15,
                                              ),
                                              options: FFButtonOptions(
                                                width: 130,
                                                height: 40,
                                                color: Colors.black,
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme
                                                      .tertiaryColor,
                                                ),
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius: 12,
                                              ),
                                              loading: _loadingButton2,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: verifystorecodeUsersRecord
                                          .isMandatoryOk ??
                                      true,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 70, 0, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        if ((verifystorecodeUsersRecord
                                                .isMandatoryOk) ==
                                            (true)) {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType
                                                  .rightToLeft,
                                              duration:
                                                  Duration(milliseconds: 400),
                                              reverseDuration:
                                                  Duration(milliseconds: 400),
                                              child: NavBarPage(
                                                  initialPage: 'HomePage'),
                                            ),
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Skip >>',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xE6000000),
                                          fontSize: 24,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, -0.35),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 40, 0, 0),
                                      child: Text(
                                        '#store code is given by Tensoftware during installation',
                                        textAlign: TextAlign.center,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xE6000000),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0, 0.75),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(
                                                initialPage: 'HomePage'),
                                          ),
                                          (r) => false,
                                        );
                                      },
                                      child: Text(
                                        'Skip>>',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
