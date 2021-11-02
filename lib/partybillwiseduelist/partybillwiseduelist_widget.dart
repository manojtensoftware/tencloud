import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../billadjusteddetail/billadjusteddetail_widget.dart';
import '../components/recieptcompo_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PartybillwiseduelistWidget extends StatefulWidget {
  PartybillwiseduelistWidget({
    Key key,
    this.acname,
    this.acid,
  }) : super(key: key);

  final String acname;
  final int acid;

  @override
  _PartybillwiseduelistWidgetState createState() =>
      _PartybillwiseduelistWidgetState();
}

class _PartybillwiseduelistWidgetState
    extends State<PartybillwiseduelistWidget> {
  bool _loadingButton = false;
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
          List<UsersRecord> partybillwiseduelistUsersRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final partybillwiseduelistUsersRecord =
              partybillwiseduelistUsersRecordList.isNotEmpty
                  ? partybillwiseduelistUsersRecordList.first
                  : null;
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
                    Expanded(
                      child: FutureBuilder<dynamic>(
                        future: partybillwiseduelistCall(
                          dbase: partybillwiseduelistUsersRecord.dataPath,
                          id: widget.acid,
                          txt: 'CUSTOMER',
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
                          final listViewPartybillwiseduelistResponse =
                              snapshot.data;
                          return Builder(
                            builder: (context) {
                              final duelist = getJsonField(
                                          listViewPartybillwiseduelistResponse,
                                          r'''$.''')
                                      ?.toList() ??
                                  [];
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                scrollDirection: Axis.vertical,
                                itemCount: duelist.length,
                                itemBuilder: (context, duelistIndex) {
                                  final duelistItem = duelist[duelistIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5, 5, 5, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BilladjusteddetailWidget(
                                              billinfo: duelistItem,
                                              acname: widget.acname,
                                              acid: widget.acid,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Card(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        color: FlutterFlowTheme.tertiaryColor,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Bill Date',
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                                  duelistItem,
                                                                  r'''$..vch_date''')
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Invoice No',
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                                  duelistItem,
                                                                  r'''$..inv_no''')
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Total Due',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: FlutterFlowTheme
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                                  duelistItem,
                                                                  r'''$..total_due''')
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                FlutterFlowTheme
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Balance Due',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFF0A691B),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                                  duelistItem,
                                                                  r'''$..due''')
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFF0A691B),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(5, 5, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'Days Over',
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                      color: Color(0xFFF20A0A),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 0, 5, 0),
                                                        child: Text(
                                                          getJsonField(
                                                                  duelistItem,
                                                                  r'''$..days''')
                                                              .toString(),
                                                          textAlign:
                                                              TextAlign.end,
                                                          style:
                                                              FlutterFlowTheme
                                                                  .bodyText1
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Color(
                                                                0xFFF20A0A),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 3, 0, 0),
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
                                                              RecieptcompoWidget(
                                                            acid: widget.acid,
                                                            billinfo:
                                                                duelistItem,
                                                            dbase:
                                                                partybillwiseduelistUsersRecord
                                                                    .dataPath,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          setState(() =>
                                                              _loadingButton =
                                                                  true);
                                                          try {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.5,
                                                                  child:
                                                                      RecieptcompoWidget(
                                                                    acid: widget
                                                                        .acid,
                                                                    billinfo:
                                                                        duelistItem,
                                                                    dbase: partybillwiseduelistUsersRecord
                                                                        .dataPath,
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          } finally {
                                                            setState(() =>
                                                                _loadingButton =
                                                                    false);
                                                          }
                                                        },
                                                        text: 'Pay',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 60,
                                                          height: 30,
                                                          color:
                                                              FlutterFlowTheme
                                                                  .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme
                                                                  .subtitle2
                                                                  .override(
                                                            fontFamily:
                                                                'Poppins',
                                                            color: Colors.white,
                                                          ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius: 12,
                                                        ),
                                                        loading: _loadingButton,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment:
                                                  AlignmentDirectional(0.05, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(5, 3, 0, 0),
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
                                                              RecieptcompoWidget(
                                                            acid: widget.acid,
                                                            billinfo:
                                                                duelistItem,
                                                            dbase:
                                                                partybillwiseduelistUsersRecord
                                                                    .dataPath,
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
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
