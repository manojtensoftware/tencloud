import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class OrderlistWidget extends StatefulWidget {
  OrderlistWidget({
    Key key,
    this.acid,
    this.acname,
    this.dbase,
  }) : super(key: key);

  final int acid;
  final String acname;
  final String dbase;

  @override
  _OrderlistWidgetState createState() => _OrderlistWidgetState();
}

class _OrderlistWidgetState extends State<OrderlistWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        title: Text(
          widget.acname,
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
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        'Total Order Value:',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Poppins',
                          color: FlutterFlowTheme.primaryColor,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                        child: FutureBuilder<dynamic>(
                          future: orderlistbypartyCall(
                            stype: 'ORDERSUMMARY',
                            dbase: widget.dbase,
                            pid: widget.acid,
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
                            final netamountOrderlistbypartyResponse =
                                snapshot.data;
                            return Text(
                              getJsonField(netamountOrderlistbypartyResponse,
                                      r'''$..namount''')
                                  .toString(),
                              textAlign: TextAlign.end,
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.primaryColor,
                                fontSize: 18,
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: orderlistbypartyCall(
                    stype: 'ORDERLIST',
                    dbase: widget.dbase,
                    pid: widget.acid,
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
                    final listViewOrderlistbypartyResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final itemlist = getJsonField(
                                    listViewOrderlistbypartyResponse, r'''$.''')
                                ?.toList() ??
                            [];
                        return InkWell(
                          onLongPress: () async {
                            await Share.share(getJsonField(
                                    listViewOrderlistbypartyResponse, r'''$.''')
                                .toString());
                          },
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            itemCount: itemlist.length,
                            itemBuilder: (context, itemlistIndex) {
                              final itemlistItem = itemlist[itemlistIndex];
                              return Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: Color(0xFFF5F5F5),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getJsonField(itemlistItem,
                                                      r'''$..item_name''')
                                                  .toString(),
                                              style: FlutterFlowTheme.bodyText1
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Color(0xFFF20A0A),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              'CS:${getJsonField(itemlistItem, r'''$..cs''').toString()}',
                                              style: FlutterFlowTheme.bodyText1,
                                            ),
                                            Text(
                                              'Pcs:${getJsonField(itemlistItem, r'''$..pcs''').toString()}',
                                              style: FlutterFlowTheme.bodyText1,
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Align(
                                          alignment:
                                              AlignmentDirectional(0.65, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                'Rs.${getJsonField(itemlistItem, r'''$..net_amount''').toString()}',
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme
                                                    .bodyText1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Color(0xFF0A691B),
                                                  fontSize: 18,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 10, 0),
                                            child: InkWell(
                                              onTap: () async {
                                                await orderdeleteCall(
                                                  stype: 'DELETE',
                                                  dbase: widget.dbase,
                                                  id: getJsonField(itemlistItem,
                                                      r'''$..id'''),
                                                );
                                              },
                                              child: Icon(
                                                Icons.cancel_outlined,
                                                color: Color(0xFFE30E0E),
                                                size: 24,
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
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
