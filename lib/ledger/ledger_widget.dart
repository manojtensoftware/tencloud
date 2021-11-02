import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/accountingvchdetail_widget.dart';
import '../daterange/daterange_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class LedgerWidget extends StatefulWidget {
  LedgerWidget({
    Key key,
    this.customerid,
  }) : super(key: key);

  final dynamic customerid;

  @override
  _LedgerWidgetState createState() => _LedgerWidgetState();
}

class _LedgerWidgetState extends State<LedgerWidget> {
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
          List<UsersRecord> ledgerUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final ledgerUsersRecord = ledgerUsersRecordList.isNotEmpty
              ? ledgerUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFFBC02D),
              automaticallyImplyLeading: true,
              title: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    getJsonField(widget.customerid, r'''$..account_name''')
                        .toString(),
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Poppins',
                      color: Color(0xE6000000),
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 10, 0),
                  child: InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DaterangeWidget(),
                        ),
                      );
                    },
                    child: FaIcon(
                      FontAwesomeIcons.calendarAlt,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                )
              ],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: Color(0xFFF5F5F5),
            body: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 650,
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                    ),
                    child: FutureBuilder<dynamic>(
                      future: ledgerCall(
                        stype: 'LEDGER',
                        dbase: ledgerUsersRecord.dataPath,
                        id: getJsonField(widget.customerid, r'''$..id'''),
                        ddate1: functions
                            .formatdateforquery(ledgerUsersRecord.fromDate),
                        txt: 'CUSTOMER',
                        ddate2: functions
                            .formatdateforquery(ledgerUsersRecord.toDate),
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
                        final listViewLedgerResponse = snapshot.data;
                        return Builder(
                          builder: (context) {
                            final ledgr =
                                getJsonField(listViewLedgerResponse, r'''$.''')
                                        ?.toList() ??
                                    [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.vertical,
                              itemCount: ledgr.length,
                              itemBuilder: (context, ledgrIndex) {
                                final ledgrItem = ledgr[ledgrIndex];
                                return Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.tertiaryColor,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: Text(
                                                getJsonField(ledgrItem,
                                                        r'''$..v_type''')
                                                    .toString(),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    getJsonField(ledgrItem,
                                                            r'''$..amount''')
                                                        .toString(),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible:
                                                  functions.convertinttobool(
                                                          getJsonField(
                                                              ledgrItem,
                                                              r'''$..amount'''),
                                                          'G') ??
                                                      true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              AccountingvchdetailWidget(
                                                            voucherinfo:
                                                                ledgrItem,
                                                            dbase:
                                                                ledgerUsersRecord
                                                                    .dataPath,
                                                            accountinfo: widget
                                                                .customerid,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.add_circle,
                                                    color: Color(0xFF0A691B),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Visibility(
                                              visible:
                                                  functions.convertinttobool(
                                                          getJsonField(
                                                              ledgrItem,
                                                              r'''$..amount'''),
                                                          'R') ??
                                                      true,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    await showModalBottomSheet(
                                                      isScrollControlled: true,
                                                      context: context,
                                                      builder: (context) {
                                                        return Container(
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.5,
                                                          child:
                                                              AccountingvchdetailWidget(
                                                            voucherinfo:
                                                                ledgrItem,
                                                            dbase:
                                                                ledgerUsersRecord
                                                                    .dataPath,
                                                            accountinfo: widget
                                                                .customerid,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Icon(
                                                    Icons.remove_circle,
                                                    color: Color(0xFFE30E0E),
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 5, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 10, 0, 0),
                                              child: Text(
                                                getJsonField(ledgrItem,
                                                        r'''$..vch_date''')
                                                    .toString(),
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Align(
                                                alignment:
                                                    AlignmentDirectional(1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    'Balance',
                                                    textAlign: TextAlign.end,
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 5, 0),
                                                child: Text(
                                                  '00.00',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider()
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
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0, 1),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBC02D),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Opening Bal (As on)${dateTimeFormat('d/M/y', ledgerUsersRecord.fromDate)}',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xE6000000),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.05, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 5, 0),
                                      child: FutureBuilder<dynamic>(
                                        future: invoicelistCall(
                                          stype: 'OPENINGCLOSINGBALANCE',
                                          dbase: ledgerUsersRecord.dataPath,
                                          id: getJsonField(
                                              widget.customerid, r'''$..id'''),
                                          ddate1: functions.formatdateforquery(
                                              ledgerUsersRecord.fromDate),
                                          ddate2: functions.formatdateforquery(
                                              ledgerUsersRecord.toDate),
                                          txt: 'OPENING',
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFFFBC02D),
                                                ),
                                              ),
                                            );
                                          }
                                          final openingbalInvoicelistResponse =
                                              snapshot.data;
                                          return Text(
                                            getJsonField(
                                                    openingbalInvoicelistResponse,
                                                    r'''$..balance''')
                                                .toString(),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xE6000000),
                                              fontSize: 16,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 0, 0),
                                      child: Text(
                                        'Running Balalnce',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xE6000000),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0, 0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 5, 0),
                                      child: FutureBuilder<dynamic>(
                                        future: invoicelistCall(
                                          stype: 'OPENINGCLOSINGBALANCE',
                                          dbase: ledgerUsersRecord.dataPath,
                                          id: getJsonField(
                                              widget.customerid, r'''$..id'''),
                                          ddate1: functions.formatdateforquery(
                                              ledgerUsersRecord.fromDate),
                                          ddate2: functions.formatdateforquery(
                                              ledgerUsersRecord.toDate),
                                          txt: 'CLOSING',
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Color(0xFFFBC02D),
                                                ),
                                              ),
                                            );
                                          }
                                          final closingbalInvoicelistResponse =
                                              snapshot.data;
                                          return Text(
                                            getJsonField(
                                                    closingbalInvoicelistResponse,
                                                    r'''$..balance''')
                                                .toString(),
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xE6000000),
                                              fontSize: 18,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
