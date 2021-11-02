import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserdetailWidget extends StatefulWidget {
  UserdetailWidget({
    Key key,
    this.storeinfo,
    this.userinfo,
  }) : super(key: key);

  final dynamic storeinfo;
  final dynamic userinfo;

  @override
  _UserdetailWidgetState createState() => _UserdetailWidgetState();
}

class _UserdetailWidgetState extends State<UserdetailWidget> {
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference),
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
        final userdetailUsersRecord = snapshot.data;
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
                    padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Update Details',
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
                                          10, 0, 0, 0),
                                      child: AuthUserStreamWidget(
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
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.93,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.tertiaryColor,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Color(0xFF020000),
                                        width: 1,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: Text(
                                                  'Firm Name:',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: Text(
                                                  getJsonField(widget.storeinfo,
                                                          r'''$..client_name''')
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: Text(
                                                  'Address:',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(32, 5, 0, 0),
                                                child: Text(
                                                  getJsonField(widget.storeinfo,
                                                          r'''$..client_city''')
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 10, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: Text(
                                                  'User Name:',
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 5, 0, 0),
                                                child: Text(
                                                  getJsonField(widget.userinfo,
                                                          r'''$..name''')
                                                      .toString(),
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10, 10, 10, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Status:',
                                                style:
                                                    FlutterFlowTheme.bodyText1,
                                              ),
                                              Visibility(
                                                visible: getJsonField(
                                                        widget.userinfo,
                                                        r'''$..status''') ??
                                                    true,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(52, 0, 0, 0),
                                                  child: Text(
                                                    'Active',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF09621A),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: !(getJsonField(
                                                        widget.userinfo,
                                                        r'''$..status''')) ??
                                                    true,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    'Not Active',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFEF5350),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 40, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton1 = true);
                                                  try {
                                                    if (getJsonField(
                                                        widget.userinfo,
                                                        r'''$..status''')) {
                                                      final usersUpdateData =
                                                          createUsersRecordData(
                                                        displayName: getJsonField(
                                                                widget.userinfo,
                                                                r'''$..name''')
                                                            .toString(),
                                                        firmName: getJsonField(
                                                                widget
                                                                    .storeinfo,
                                                                r'''$..client_name''')
                                                            .toString(),
                                                        storeCode: getJsonField(
                                                                widget
                                                                    .storeinfo,
                                                                r'''$..client_code''')
                                                            .toString(),
                                                        isMandatoryOk: true,
                                                        dataPath: getJsonField(
                                                                widget
                                                                    .storeinfo,
                                                                r'''$..data_path''')
                                                            .toString(),
                                                        fromDate:
                                                            getCurrentTimestamp,
                                                        toDate:
                                                            getCurrentTimestamp,
                                                        selectedCity: 0,
                                                        selectedCityName:
                                                            'NONE',
                                                        selectedPartyName:
                                                            'NONE',
                                                        selectedPartyId: 0,
                                                        selectedCompany: 0,
                                                        selectedCompanyName:
                                                            'NONE',
                                                      );
                                                      await userdetailUsersRecord
                                                          .reference
                                                          .update(
                                                              usersUpdateData);
                                                    } else {
                                                      return;
                                                    }
                                                    await Navigator
                                                        .pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            NavBarPage(
                                                                initialPage:
                                                                    'HomePage'),
                                                      ),
                                                      (r) => false,
                                                    );
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton1 =
                                                            false);
                                                  }
                                                },
                                                text: 'Update',
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Color(0xFF080101),
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFFBC02D),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton1,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 20, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  setState(() =>
                                                      _loadingButton2 = true);
                                                  try {
                                                    Navigator.pop(context);
                                                  } finally {
                                                    setState(() =>
                                                        _loadingButton2 =
                                                            false);
                                                  }
                                                },
                                                text: 'Back',
                                                icon: Icon(
                                                  Icons.arrow_back_ios_rounded,
                                                  size: 15,
                                                ),
                                                options: FFButtonOptions(
                                                  width: 130,
                                                  height: 40,
                                                  color: Color(0xFF080101),
                                                  textStyle: FlutterFlowTheme
                                                      .subtitle2
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: Color(0xFFFBC02D),
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius: 12,
                                                ),
                                                loading: _loadingButton2,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 50, 0, 0),
                                child: Text(
                                  'Check your Name in User Field if not appear then must include your name in mobile user list on windows application otherwise you cant run app',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
                                    fontSize: 14,
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
    );
  }
}
