import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountingvoucherdetailWidget extends StatefulWidget {
  AccountingvoucherdetailWidget({
    Key key,
    this.voucherinfo,
    this.partyinfo,
  }) : super(key: key);

  final dynamic voucherinfo;
  final dynamic partyinfo;

  @override
  _AccountingvoucherdetailWidgetState createState() =>
      _AccountingvoucherdetailWidgetState();
}

class _AccountingvoucherdetailWidgetState
    extends State<AccountingvoucherdetailWidget> {
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
          List<UsersRecord> accountingvoucherdetailUsersRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final accountingvoucherdetailUsersRecord =
              accountingvoucherdetailUsersRecordList.isNotEmpty
                  ? accountingvoucherdetailUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Text(
                getJsonField(widget.partyinfo, r'''$..account_name''')
                    .toString(),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: FlutterFlowTheme.tertiaryColor,
                  fontSize: 16,
                ),
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
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Voucher No:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF20A0A),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            getJsonField(
                                    widget.voucherinfo, r'''$..voucher_no''')
                                .toString(),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Date:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(52, 0, 0, 0),
                            child: Text(
                              getJsonField(
                                      widget.voucherinfo, r'''$..vch_date''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Type:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(52, 0, 0, 0),
                            child: Text(
                              getJsonField(
                                      widget.voucherinfo, r'''$..vch_type''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: FutureBuilder<dynamic>(
                          future: accountingvoucherdetailCall(
                            dbase: accountingvoucherdetailUsersRecord.dataPath,
                            txt: getJsonField(
                                    widget.voucherinfo, r'''$..voucher_no''')
                                .toString(),
                            txt2: getJsonField(
                                    widget.voucherinfo, r'''$..v_type''')
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
                            final listViewAccountingvoucherdetailResponse =
                                snapshot.data;
                            return Builder(
                              builder: (context) {
                                final vchinfo = getJsonField(
                                            listViewAccountingvoucherdetailResponse,
                                            r'''$.''')
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: vchinfo.length,
                                  itemBuilder: (context, vchinfoIndex) {
                                    final vchinfoItem = vchinfo[vchinfoIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 5, 5, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'Hello World',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              fontSize: 16,
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0.85, 0),
                                              child: Text(
                                                'Hello World',
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          },
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
