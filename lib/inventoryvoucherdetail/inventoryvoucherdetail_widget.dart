import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InventoryvoucherdetailWidget extends StatefulWidget {
  InventoryvoucherdetailWidget({
    Key key,
    this.invoiceinfo,
    this.partyinfo,
  }) : super(key: key);

  final dynamic invoiceinfo;
  final dynamic partyinfo;

  @override
  _InventoryvoucherdetailWidgetState createState() =>
      _InventoryvoucherdetailWidgetState();
}

class _InventoryvoucherdetailWidgetState
    extends State<InventoryvoucherdetailWidget> {
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
          List<UsersRecord> inventoryvoucherdetailUsersRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final inventoryvoucherdetailUsersRecord =
              inventoryvoucherdetailUsersRecordList.isNotEmpty
                  ? inventoryvoucherdetailUsersRecordList.first
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
                            'Invoice No:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFFF20A0A),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            getJsonField(
                                    widget.invoiceinfo, r'''$..voucher_no''')
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
                                EdgeInsetsDirectional.fromSTEB(42, 0, 0, 0),
                            child: Text(
                              getJsonField(
                                      widget.invoiceinfo, r'''$..vch_date''')
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
                          future: inventoryvoucherdetailCall(
                            dbase: inventoryvoucherdetailUsersRecord.dataPath,
                            txt: getJsonField(
                                    widget.invoiceinfo, r'''$..voucher_no''')
                                .toString(),
                            txt2: getJsonField(
                                    widget.invoiceinfo, r'''$..v_type''')
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
                            final listViewInventoryvoucherdetailResponse =
                                snapshot.data;
                            return Builder(
                              builder: (context) {
                                final invoicedetail = getJsonField(
                                            listViewInventoryvoucherdetailResponse,
                                            r'''$.''')
                                        ?.toList() ??
                                    [];
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: invoicedetail.length,
                                  itemBuilder: (context, invoicedetailIndex) {
                                    final invoicedetailItem =
                                        invoicedetail[invoicedetailIndex];
                                    return Container(
                                      width: 100,
                                      height: 185,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.tertiaryColor,
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 0, 0, 0),
                                                  child: Text(
                                                    'Item Name:',
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.75, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      getJsonField(
                                                              invoicedetailItem,
                                                              r'''$..item_name''')
                                                          .toString(),
                                                      textAlign: TextAlign.end,
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
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
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'Cs:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.75, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                invoicedetailItem,
                                                                r'''$..cs''')
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'Pcs:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.75, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                invoicedetailItem,
                                                                r'''$..pcs''')
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'T.Qty:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.75, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                invoicedetailItem,
                                                                r'''$..tqty''')
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                                    0, 5, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'Rate:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.75, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                invoicedetailItem,
                                                                r'''$..rate''')
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
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
                                                    0, 5, 0, 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 0, 0),
                                                    child: Text(
                                                      'Net Amount:',
                                                      style: FlutterFlowTheme
                                                          .bodyText1
                                                          .override(
                                                        fontFamily: 'Poppins',
                                                        color:
                                                            Color(0xFFF20A0A),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.75, 0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10, 0, 0, 0),
                                                      child: Text(
                                                        getJsonField(
                                                                invoicedetailItem,
                                                                r'''$..net_amount''')
                                                            .toString(),
                                                        textAlign:
                                                            TextAlign.end,
                                                        style: FlutterFlowTheme
                                                            .bodyText1
                                                            .override(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 1,
                                            thickness: 2,
                                            color:
                                                FlutterFlowTheme.primaryColor,
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
