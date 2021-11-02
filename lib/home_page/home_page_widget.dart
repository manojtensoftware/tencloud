import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../companystock/companystock_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../orderentry/orderentry_widget.dart';
import '../partybalancelist/partybalancelist_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord
              .where('uid', isEqualTo: currentUserUid)
              .where('is_mandatory_ok', isEqualTo: true),
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
          List<UsersRecord> homePageUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final homePageUsersRecord = homePageUsersRecordList.isNotEmpty
              ? homePageUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFFBC02D),
              automaticallyImplyLeading: false,
              title: Text(
                homePageUsersRecord.firmName,
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xFF080101),
                  fontSize: 18,
                ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 4,
            ),
            backgroundColor: Color(0xFFF5F5F5),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderentryWidget(),
                  ),
                );
              },
              backgroundColor: FlutterFlowTheme.primaryColor,
              elevation: 8,
              child: Icon(
                Icons.add_circle_outline,
                color: FlutterFlowTheme.tertiaryColor,
                size: 30,
              ),
            ),
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                            child: Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.primaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Total Sale',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.tertiaryColor,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FutureBuilder<dynamic>(
                                      future: summaryCall(
                                        dbase: homePageUsersRecord.dataPath,
                                        stype: 'SALESUMMARY',
                                        id: functions
                                            .monthno(getCurrentTimestamp),
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
                                        final textSummaryResponse =
                                            snapshot.data;
                                        return Text(
                                          functions
                                              .roundoff(getJsonField(
                                                  textSummaryResponse,
                                                  r'''$..BILLAMT'''))
                                              .toString()
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontSize: 18,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFFBC02D),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: Text(
                                      'Total Purchase',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF080101),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 10, 0, 0),
                                    child: FutureBuilder<dynamic>(
                                      future: summaryCall(
                                        dbase: homePageUsersRecord.dataPath,
                                        stype: 'PURCHASESUMMARY',
                                        id: functions
                                            .monthno(getCurrentTimestamp),
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
                                        final purchaseamtSummaryResponse =
                                            snapshot.data;
                                        return Text(
                                          functions
                                              .roundoff(getJsonField(
                                                  purchaseamtSummaryResponse,
                                                  r'''$..bamt'''))
                                              .toString()
                                              .toString(),
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF080101),
                                            fontSize: 18,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 130,
                        decoration: BoxDecoration(
                          color: Color(0xFF81D4FA),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                'Sales Summary',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Cash',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Image.asset(
                                      'assets/images/rupee_(1).png',
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 3, 0, 0),
                                      child: FutureBuilder<dynamic>(
                                        future: summaryCall(
                                          dbase: homePageUsersRecord.dataPath,
                                          stype: 'SALESUMMARY',
                                          id: functions
                                              .monthno(getCurrentTimestamp),
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
                                          final textSummaryResponse =
                                              snapshot.data;
                                          return Text(
                                            functions
                                                .roundoff(getJsonField(
                                                    textSummaryResponse,
                                                    r'''$..CASHREC'''))
                                                .toString()
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF080101),
                                              fontSize: 16,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Credit',
                                      style: FlutterFlowTheme.bodyText1,
                                    ),
                                    Image.asset(
                                      'assets/images/man_(1).png',
                                      width: 40,
                                      height: 40,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 3, 0, 0),
                                      child: FutureBuilder<dynamic>(
                                        future: summaryCall(
                                          dbase: homePageUsersRecord.dataPath,
                                          stype: 'SALESUMMARY',
                                          id: functions
                                              .monthno(getCurrentTimestamp),
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
                                          final textSummaryResponse =
                                              snapshot.data;
                                          return Text(
                                            functions
                                                .roundoff(getJsonField(
                                                    textSummaryResponse,
                                                    r'''$..CRBAL'''))
                                                .toString()
                                                .toString(),
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF080101),
                                              fontSize: 16,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF388E3C),
                          ),
                        ),
                        child: FutureBuilder<dynamic>(
                          future: balanceonlyCall(
                            stype: 'BALANCEONLY',
                            dbase: homePageUsersRecord.dataPath,
                            txt: 'CUSTOMER',
                            id: 0,
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
                            final receivablerowBalanceonlyResponse =
                                snapshot.data;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PartybalancelistWidget(
                                      type: 'CUSTOMER',
                                      dbase: homePageUsersRecord.dataPath,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Receivable',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.65, 0),
                                      child: Text(
                                        'Rs. ${getJsonField(receivablerowBalanceonlyResponse, r'''$..''').toString()}',
                                        textAlign: TextAlign.end,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.tertiaryColor,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0xFFFBC02D),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Color(0xFF388E3C),
                          ),
                        ),
                        child: FutureBuilder<dynamic>(
                          future: balanceonlyCall(
                            stype: 'BALANCEONLY',
                            dbase: homePageUsersRecord.dataPath,
                            txt: 'SUPPLIER',
                            id: 0,
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
                            final rowBalanceonlyResponse = snapshot.data;
                            return InkWell(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PartybalancelistWidget(
                                      type: 'SUPPLIER',
                                      dbase: homePageUsersRecord.dataPath,
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Payble',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.tertiaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(0.8, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 10, 0),
                                        child: Text(
                                          'Rs. ${getJsonField(rowBalanceonlyResponse, r'''$..''').toString()}',
                                          textAlign: TextAlign.end,
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color:
                                                FlutterFlowTheme.tertiaryColor,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xFF81D4FA),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Company Wise Stock Value',
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xE6000000),
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<dynamic>(
                        future: allcompanystockvalueCall(
                          dbase: homePageUsersRecord.dataPath,
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
                          final listViewAllcompanystockvalueResponse =
                              snapshot.data;
                          return Builder(
                            builder: (context) {
                              final companystock = getJsonField(
                                          listViewAllcompanystockvalueResponse,
                                          r'''$.''')
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: companystock.length,
                                itemBuilder: (context, companystockIndex) {
                                  final companystockItem =
                                      companystock[companystockIndex];
                                  return InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 200),
                                          reverseDuration:
                                              Duration(milliseconds: 200),
                                          child: CompanystockWidget(
                                            companyname: companystockItem,
                                            id: companystockItem,
                                            dbase: homePageUsersRecord.dataPath,
                                          ),
                                        ),
                                      );
                                    },
                                    child: ListTile(
                                      title: Text(
                                        getJsonField(companystockItem,
                                                r'''$..company_name''')
                                            .toString(),
                                        style: FlutterFlowTheme.title3,
                                      ),
                                      subtitle: Text(
                                        'Rs. ${getJsonField(companystockItem, r'''$..stockvalue''').toString()}',
                                        style:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Poppins',
                                          color: FlutterFlowTheme.primaryColor,
                                        ),
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xFF303030),
                                        size: 20,
                                      ),
                                      tileColor: FlutterFlowTheme.tertiaryColor,
                                      dense: false,
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
