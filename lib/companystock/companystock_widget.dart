import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompanystockWidget extends StatefulWidget {
  CompanystockWidget({
    Key key,
    this.companyname,
    this.id,
    this.dbase,
  }) : super(key: key);

  final dynamic companyname;
  final dynamic id;
  final String dbase;

  @override
  _CompanystockWidgetState createState() => _CompanystockWidgetState();
}

class _CompanystockWidgetState extends State<CompanystockWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFFBC02D),
        automaticallyImplyLeading: true,
        title: Text(
          getJsonField(widget.companyname, r'''$..company_name''').toString(),
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
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: companystockCall(
                    stype: 'STOCK',
                    dbase: widget.dbase,
                    id: getJsonField(widget.id, r'''$..id'''),
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
                    final listViewCompanystockResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final stocklist = getJsonField(
                                    listViewCompanystockResponse, r'''$.''')
                                ?.toList() ??
                            [];
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          itemCount: stocklist.length,
                          itemBuilder: (context, stocklistIndex) {
                            final stocklistItem = stocklist[stocklistIndex];
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        getJsonField(stocklistItem,
                                                r'''$..item_name''')
                                            .toString()
                                            .maybeHandleOverflow(maxChars: 30),
                                        textAlign: TextAlign.start,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFF20A0A),
                                          fontSize: 16,
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.85, 0),
                                          child: Text(
                                            'Rs. ${getJsonField(stocklistItem, r'''$..vals''').toString()}',
                                            textAlign: TextAlign.end,
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'MRP:${getJsonField(stocklistItem, r'''$..mr''').toString()}',
                                          style: FlutterFlowTheme.bodyText1
                                              .override(
                                            fontFamily: 'Poppins',
                                            color: Color(0xFF0A691B),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40, 0, 0, 0),
                                          child: Text(
                                            'CS:${getJsonField(stocklistItem, r'''$..csqt''').toString()}',
                                            style: FlutterFlowTheme.bodyText1
                                                .override(
                                              fontFamily: 'Poppins',
                                              color: Color(0xFF0A691B),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.85, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(60, 0, 10, 0),
                                              child: Text(
                                                'Total:${getJsonField(stocklistItem, r'''$..sqty''').toString()}',
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0A691B),
                                                ),
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
  }
}
