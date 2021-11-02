import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../invoicelist/invoicelist_widget.dart';
import '../ledger/ledger_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountsearchoptionWidget extends StatefulWidget {
  AccountsearchoptionWidget({
    Key key,
    this.customerdataid,
  }) : super(key: key);

  final dynamic customerdataid;

  @override
  _AccountsearchoptionWidgetState createState() =>
      _AccountsearchoptionWidgetState();
}

class _AccountsearchoptionWidgetState extends State<AccountsearchoptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InvoicelistWidget(
                                customerdataid: widget.customerdataid,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Image.asset(
                                'assets/images/invoice.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                              child: Text(
                                'Invoices',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LedgerWidget(
                                customerid: widget.customerdataid,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: Image.asset(
                                'assets/images/ledger.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                              child: Text(
                                'Ledger',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/due-date.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                            child: Text(
                              'Dues List',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(1, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/searching.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Items Sold',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/rupee_(1).png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                            child: Text(
                              'Reciept',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
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
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: 55,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.tertiaryColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: Image.asset(
                              'assets/images/order-processed.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(25, 0, 0, 0),
                            child: Text(
                              'Orders',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
