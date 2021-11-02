import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderlistbyagentWidget extends StatefulWidget {
  OrderlistbyagentWidget({Key key}) : super(key: key);

  @override
  _OrderlistbyagentWidgetState createState() => _OrderlistbyagentWidgetState();
}

class _OrderlistbyagentWidgetState extends State<OrderlistbyagentWidget> {
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
          List<UsersRecord> orderlistbyagentUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final orderlistbyagentUsersRecord =
              orderlistbyagentUsersRecordList.isNotEmpty
                  ? orderlistbyagentUsersRecordList.first
                  : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: Color(0xFFFBC02D),
              automaticallyImplyLeading: true,
              title: Text(
                'Current Orders',
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
            backgroundColor: FlutterFlowTheme.tertiaryColor,
            body: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.tertiaryColor,
                    ),
                    child: FutureBuilder<dynamic>(
                      future: ordersummarybyagentCall(
                        dbase: orderlistbyagentUsersRecord.dataPath,
                        agentPhone: functions.mobilenoformat(
                            orderlistbyagentUsersRecord.phoneNumber),
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
                        final listViewOrdersummarybyagentResponse =
                            snapshot.data;
                        return Builder(
                          builder: (context) {
                            final orderlist = getJsonField(
                                        listViewOrdersummarybyagentResponse,
                                        r'''$.''')
                                    ?.toList() ??
                                [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: orderlist.length,
                              itemBuilder: (context, orderlistIndex) {
                                final orderlistItem = orderlist[orderlistIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 2, 0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.tertiaryColor,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Slidable(
                                                actionPane:
                                                    const SlidableScrollActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: 'Delete',
                                                    color: Color(0xE6000000),
                                                    icon: Icons.delete_forever,
                                                    onTap: () async {
                                                      await orderdeleteCall(
                                                        stype: 'DELETE',
                                                        dbase:
                                                            orderlistbyagentUsersRecord
                                                                .dataPath,
                                                        id: getJsonField(
                                                            orderlistItem,
                                                            r'''$..id'''),
                                                        pid: 0,
                                                      );
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .topToBottom,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  400),
                                                          reverseDuration:
                                                              Duration(
                                                                  milliseconds:
                                                                      400),
                                                          child: NavBarPage(
                                                              initialPage:
                                                                  'Orderlistbyagent'),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                ],
                                                child: ListTile(
                                                  title: Text(
                                                    getJsonField(orderlistItem,
                                                            r'''$..account_name''')
                                                        .toString(),
                                                    style: FlutterFlowTheme
                                                        .title3
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  subtitle: Text(
                                                    'Rs. ${getJsonField(orderlistItem, r'''$..namount''').toString()}',
                                                    style: FlutterFlowTheme
                                                        .subtitle2
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFE91E63),
                                                    ),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.arrow_back_ios,
                                                    color: Color(0xFF303030),
                                                    size: 20,
                                                  ),
                                                  tileColor: FlutterFlowTheme
                                                      .tertiaryColor,
                                                  dense: false,
                                                ),
                                              ),
                                              Divider(
                                                height: 1,
                                                thickness: 1,
                                                color: Color(0xFF09621A),
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
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                        border: Border.all(
                          color: FlutterFlowTheme.primaryColor,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Total Order',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: FutureBuilder<dynamic>(
                              future: recieptCall(
                                stype: 'RECIEPTSUMMARY',
                                dbase: orderlistbyagentUsersRecord.dataPath,
                                mobile: orderlistbyagentUsersRecord.phoneNumber,
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
                                final textRecieptResponse = snapshot.data;
                                return Text(
                                  getJsonField(
                                          textRecieptResponse, r'''$..amount''')
                                      .toString(),
                                  textAlign: TextAlign.end,
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.tertiaryColor,
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
          );
        },
      ),
    );
  }
}
