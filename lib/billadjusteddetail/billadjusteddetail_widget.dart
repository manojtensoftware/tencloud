import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BilladjusteddetailWidget extends StatefulWidget {
  BilladjusteddetailWidget({
    Key key,
    this.billinfo,
    this.acname,
    this.acid,
  }) : super(key: key);

  final dynamic billinfo;
  final String acname;
  final int acid;

  @override
  _BilladjusteddetailWidgetState createState() =>
      _BilladjusteddetailWidgetState();
}

class _BilladjusteddetailWidgetState extends State<BilladjusteddetailWidget> {
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
          List<UsersRecord> billadjusteddetailUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final billadjusteddetailUsersRecord =
              billadjusteddetailUsersRecordList.isNotEmpty
                  ? billadjusteddetailUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    widget.acname,
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  ),
                  Text(
                    getJsonField(widget.billinfo, r'''$..inv_no''').toString(),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                  )
                ],
              ),
              actions: [],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: Color(0xFFF5F5F5),
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: FutureBuilder<dynamic>(
                        future: billadjusteddetailCall(
                          dbase: billadjusteddetailUsersRecord.dataPath,
                          id: widget.acid,
                          txt: getJsonField(widget.billinfo, r'''$..inv_no''')
                              .toString(),
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
                          final listViewBilladjusteddetailResponse =
                              snapshot.data;
                          return Builder(
                            builder: (context) {
                              final adjustedinfo = getJsonField(
                                          listViewBilladjusteddetailResponse,
                                          r'''$.''')
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: adjustedinfo.length,
                                itemBuilder: (context, adjustedinfoIndex) {
                                  final adjustedinfoItem =
                                      adjustedinfo[adjustedinfoIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 0),
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: Color(0xFFF5F5F5),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                                  child: Text(
                                                    'Voucher No',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Text(
                                                  getJsonField(adjustedinfoItem,
                                                          r'''$..voucher_no''')
                                                      .toString(),
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    color: FlutterFlowTheme
                                                        .primaryColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Text(
                                                      'Date',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    getJsonField(
                                                            adjustedinfoItem,
                                                            r'''$..voucher_date''')
                                                        .toString(),
                                                    textAlign: TextAlign.end,
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
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 0, 0, 0),
                                                    child: Text(
                                                      'Adjusted',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    getJsonField(
                                                            adjustedinfoItem,
                                                            r'''$..adjusted''')
                                                        .toString(),
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFF20A0A),
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
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
