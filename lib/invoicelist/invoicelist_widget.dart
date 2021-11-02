import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../inventoryvoucherdetail/inventoryvoucherdetail_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InvoicelistWidget extends StatefulWidget {
  InvoicelistWidget({
    Key key,
    this.customerdataid,
  }) : super(key: key);

  final dynamic customerdataid;

  @override
  _InvoicelistWidgetState createState() => _InvoicelistWidgetState();
}

class _InvoicelistWidgetState extends State<InvoicelistWidget> {
  String dropDownValue;
  bool _loadingButton = false;
  dynamic partyinvoicelist;
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
          List<UsersRecord> invoicelistUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final invoicelistUsersRecord = invoicelistUsersRecordList.isNotEmpty
              ? invoicelistUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFFBC02D),
              automaticallyImplyLeading: true,
              title: Text(
                getJsonField(widget.customerdataid, r'''$..account_name''')
                    .toString(),
                style: FlutterFlowTheme.bodyText1.override(
                  fontFamily: 'Poppins',
                  color: Color(0xE6000000),
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Material(
                              color: Colors.transparent,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.93,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Color(0xE6000000),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xFF020000),
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: FlutterFlowDropDown(
                                              options: [
                                                'SALE',
                                                'SALE RETURN',
                                                'PURCHASE',
                                                'PURCHASE RETURN'
                                              ].toList(),
                                              onChanged: (val) => setState(
                                                  () => dropDownValue = val),
                                              width: 200,
                                              height: 40,
                                              textStyle: FlutterFlowTheme
                                                  .bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.black,
                                              ),
                                              fillColor: Colors.white,
                                              elevation: 2,
                                              borderColor: Colors.transparent,
                                              borderWidth: 1,
                                              borderRadius: 8,
                                              margin: EdgeInsetsDirectional
                                                  .fromSTEB(8, 4, 8, 4),
                                              hidesUnderline: true,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() =>
                                                    _loadingButton = true);
                                                try {
                                                  partyinvoicelist =
                                                      await invoicelistCall(
                                                    stype: 'INVOICEDETAIL',
                                                    dbase:
                                                        invoicelistUsersRecord
                                                            .dataPath,
                                                    id: getJsonField(
                                                        widget.customerdataid,
                                                        r'''$..id'''),
                                                    ddate1: functions
                                                        .formatdateforquery(
                                                            invoicelistUsersRecord
                                                                .fromDate),
                                                    ddate2: functions
                                                        .formatdateforquery(
                                                            invoicelistUsersRecord
                                                                .toDate),
                                                    txt: dropDownValue,
                                                  );

                                                  setState(() {});
                                                } finally {
                                                  setState(() =>
                                                      _loadingButton = false);
                                                }
                                              },
                                              text: 'Show',
                                              options: FFButtonOptions(
                                                width: 80,
                                                height: 30,
                                                color: Color(0xFFFBC02D),
                                                textStyle: FlutterFlowTheme
                                                    .subtitle2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xE6000000),
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
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Builder(
                          builder: (context) {
                            final invlist =
                                getJsonField(partyinvoicelist, r'''$.''')
                                        ?.toList() ??
                                    [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: invlist.length,
                              itemBuilder: (context, invlistIndex) {
                                final invlistItem = invlist[invlistIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              InventoryvoucherdetailWidget(
                                            invoiceinfo: invlistItem,
                                            partyinfo: widget.customerdataid,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Card(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      color: FlutterFlowTheme.tertiaryColor,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    getJsonField(invlistItem,
                                                            r'''$..voucher_no''')
                                                        .toString(),
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Text(
                                                      getJsonField(invlistItem,
                                                              r''' $..vch_date''')
                                                          .toString(),
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 5, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .settings_outlined,
                                                          color: Colors.black,
                                                          size: 16,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .settings_outlined,
                                                          color: Colors.black,
                                                          size: 16,
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 5, 0),
                                                child: Text(
                                                  'Rs.${getJsonField(invlistItem, r'''$..bill_amount''').toString()}',
                                                  textAlign: TextAlign.end,
                                                  style: FlutterFlowTheme
                                                      .bodyText1
                                                      .override(
                                                    fontFamily: 'Poppins',
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
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
