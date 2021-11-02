import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../inventoryvoucherdetail/inventoryvoucherdetail_widget.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountingvchdetailWidget extends StatefulWidget {
  AccountingvchdetailWidget({
    Key key,
    this.voucherinfo,
    this.dbase,
    this.accountinfo,
  }) : super(key: key);

  final dynamic voucherinfo;
  final String dbase;
  final dynamic accountinfo;

  @override
  _AccountingvchdetailWidgetState createState() =>
      _AccountingvchdetailWidgetState();
}

class _AccountingvchdetailWidgetState extends State<AccountingvchdetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
            child: Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 10, 5, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Voucher Type:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Text(
                              getJsonField(widget.voucherinfo, r'''$..v_type''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.85, 0),
                              child: InkWell(
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          InventoryvoucherdetailWidget(
                                        invoiceinfo: widget.voucherinfo,
                                        partyinfo: widget.accountinfo,
                                      ),
                                    ),
                                  );
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  color: FlutterFlowTheme.tertiaryColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Voucher No:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              getJsonField(
                                      widget.voucherinfo, r'''$..voucher_no''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Ref No:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: AutoSizeText(
                              getJsonField(widget.voucherinfo, r'''$..ref_no''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Narration:',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Poppins',
                              color: FlutterFlowTheme.tertiaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: AutoSizeText(
                              getJsonField(
                                      widget.voucherinfo, r'''$..narration''')
                                  .toString(),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.tertiaryColor,
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
          ),
          Expanded(
            child: FutureBuilder<dynamic>(
              future: accountingvoucherdetailCall(
                dbase: widget.dbase,
                txt: getJsonField(widget.voucherinfo, r'''$..voucher_no''')
                    .toString(),
                txt2: getJsonField(widget.voucherinfo, r'''$..v_type''')
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
                final listViewAccountingvoucherdetailResponse = snapshot.data;
                return Builder(
                  builder: (context) {
                    final vchdetail = getJsonField(
                                listViewAccountingvoucherdetailResponse,
                                r'''$.''')
                            ?.toList() ??
                        [];
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: vchdetail.length,
                      itemBuilder: (context, vchdetailIndex) {
                        final vchdetailItem = vchdetail[vchdetailIndex];
                        return Container(
                          width: 100,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      getJsonField(vchdetailItem,
                                              r'''$..account_name''')
                                          .toString(),
                                      style: FlutterFlowTheme.bodyText1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(5, 5, 5, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Debit:',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF0A691B),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        getJsonField(
                                                vchdetailItem, r'''$..debit''')
                                            .toString(),
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        'Credit:',
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF20A0A),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5, 0, 0, 0),
                                      child: Text(
                                        getJsonField(
                                                vchdetailItem, r'''$..credit''')
                                            .toString(),
                                        style: FlutterFlowTheme.bodyText1,
                                      ),
                                    )
                                  ],
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
          )
        ],
      ),
    );
  }
}
