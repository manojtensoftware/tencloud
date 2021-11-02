import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class RecieptlistWidget extends StatefulWidget {
  RecieptlistWidget({Key key}) : super(key: key);

  @override
  _RecieptlistWidgetState createState() => _RecieptlistWidgetState();
}

class _RecieptlistWidgetState extends State<RecieptlistWidget> {
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
          List<UsersRecord> recieptlistUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final recieptlistUsersRecord = recieptlistUsersRecordList.isNotEmpty
              ? recieptlistUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.primaryColor,
              automaticallyImplyLeading: true,
              title: Text(
                'Current Reciepts',
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
                      future: recieptCall(
                        stype: 'RECIEPTLIST',
                        dbase: recieptlistUsersRecord.dataPath,
                        mobile: recieptlistUsersRecord.phoneNumber,
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
                        final listViewRecieptResponse = snapshot.data;
                        return Builder(
                          builder: (context) {
                            final recievedlist =
                                getJsonField(listViewRecieptResponse, r'''$.''')
                                        ?.toList() ??
                                    [];
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              itemCount: recievedlist.length,
                              itemBuilder: (context, recievedlistIndex) {
                                final recievedlistItem =
                                    recievedlist[recievedlistIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 2, 0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 108,
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
                                                    color: Colors.blue,
                                                    icon: Icons.delete_forever,
                                                    onTap: () async {
                                                      await recieptCall(
                                                        stype: 'DELETE',
                                                        dbase:
                                                            recieptlistUsersRecord
                                                                .dataPath,
                                                        pid: getJsonField(
                                                            recievedlistItem,
                                                            r'''$..pid'''),
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
                                                                  'Recieptlist'),
                                                        ),
                                                      );
                                                    },
                                                  )
                                                ],
                                                child: ListTile(
                                                  title: Text(
                                                    getJsonField(
                                                            recievedlistItem,
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
                                                    'Rs. ${getJsonField(recievedlistItem, r'''$..amount''').toString()}',
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
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(15, 2, 0, 0),
                                                child: Text(
                                                  'Recieved Against:${getJsonField(recievedlistItem, r'''$..against_bill''').toString()}',
                                                  style: FlutterFlowTheme
                                                      .bodyText1,
                                                ),
                                              ),
                                              Divider()
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
                                'Total Reciept',
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
                                dbase: recieptlistUsersRecord.dataPath,
                                mobile: recieptlistUsersRecord.phoneNumber,
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
                                  getJsonField(textRecieptResponse,
                                          r'''$..rectotal''')
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
